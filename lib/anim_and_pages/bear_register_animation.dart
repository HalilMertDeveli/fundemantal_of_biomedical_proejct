import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundemetals_of_biomedical/pages/page_home.dart';
import 'package:fundemetals_of_biomedical/service_firebase/service_auth.dart';
import 'package:fundemetals_of_biomedical/util/util.dart';
import 'package:rive/rive.dart';
import 'package:intl/intl.dart';

class BearRegisterAnimation extends StatefulWidget {
  @override
  State<BearRegisterAnimation> createState() => _BearRegisterAnimationState();
}

class _BearRegisterAnimationState extends State<BearRegisterAnimation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  TextEditingController dateInput = TextEditingController();
  String? _password = '';
  ServiceAuth _authService = new ServiceAuth();

  bool _isLoading = false;
  
  

  var animationLink = 'assets/login.riv';

  Artboard? artboard;

  late StateMachineController? stateMachineController;

  late SMITrigger failTrigger, successTrigger;

  late SMIBool isChecking, isHandsUp;

  late SMINumber lookNum;

  Future<bool> _submitForm()async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print("password :$_password");
      print("birth date:${dateInput.text}");
      final resultOfCreating=await _authService.registerUserWithEmailAndPassword(_name.trim(), _email.trim(), _password.toString().trim(),dateInput.text.trim());
      if (resultOfCreating==true) {
        navigatePage(context, PageHome());
        setState(() {
          _isLoading=false;
        });
      }
      else{
        print("There is error on creating user with auth");
        
      }
      
      return true;
    } else {
      return false;
    }
  }

  initArtboard() {
    rootBundle.load(animationLink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;

      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine")!;

      if (stateMachineController != null) {
        art.addController(stateMachineController!);
        for (var element in stateMachineController!.inputs) {
          //print(element); -> we got animation trigger
          if (element.name == "isChecking") {
            isChecking = element as SMIBool;
          } else if (element.name == "isHandsUp") {
            isHandsUp = element as SMIBool;
          } else if (element.name == "trigSuccess") {
            successTrigger = element as SMITrigger;
          } else if (element.name == "trigFail") {
            failTrigger = element as SMITrigger;
          } else if (element.name == 'numLook') {
            lookNum = element as SMINumber;
          }
        }
      }
      setState(() {
        artboard = art;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dateInput.text = "";
    initArtboard();
  }

  void checking() {
    isHandsUp.change(false);
    isChecking.change(true);
    lookNum.change(0);
  }

  moveEyes(value) {
    lookNum.change(value.length.toDouble());
  }

  handsUp() {
    isHandsUp.change(true);
    isChecking.change(false);
  }

  login() async{
    isHandsUp.change(false);
    isChecking.change(false);
    bool validateResult = await _submitForm();
    if (validateResult) {
      successTrigger.fire();
    } else {
      failTrigger.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading == true){
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
    }else{

   
  
    
    if (artboard != null) {
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 350,
                child: Rive(
                  artboard: artboard!,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //time picker region end
              TextFormField(
                onTap: checking,
                //move eyes
                onChanged: ((value) => moveEyes(value)),
                //move eyes
                decoration: InputDecoration(
                  labelText: 'isminizi giriniz :',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  return validateUserName(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: checking,
                onChanged: ((value) => moveEyes(value)),
                decoration: InputDecoration(
                  labelText: 'Email adresinizi  belirleyiniz:',
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _email = value!;
                },
                validator: (value) {
                  return validateEmailAddress(value);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: handsUp,
                decoration: InputDecoration(
                    labelText: 'Kullanıcı şifrenizi belirleyiniz:',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    border: OutlineInputBorder()),
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  return validatePassword(value);
                },
              ),
              //new time picker region
              Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                  child: TextField(
                    controller: dateInput,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Lütfen Doğum Tarhinizi giriniz:",
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate); //date value is here for usages

                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
              ),
              filledButton(
                "Kullanıcı Oluştur",
                Colors.white38,
                Colors.black12,
                Colors.black45,
                Colors.white,
                () {
                  _submitForm(); //we are getting values here
                  login();
                },
              )
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 400,
        height: 200,
        child: Container(color: Colors.white),
      );
    }
     }
  }
}
