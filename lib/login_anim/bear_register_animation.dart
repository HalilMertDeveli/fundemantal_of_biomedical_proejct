import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundemetals_of_biomedical/util/util.dart';
import 'package:rive/rive.dart';

class BearRegisterAnimation extends StatefulWidget {
  @override
  State<BearRegisterAnimation> createState() => _BearRegisterAnimationState();
}

class _BearRegisterAnimationState extends State<BearRegisterAnimation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  DateTime selectedDate = DateTime.now();
  String? _password = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var animationLink = 'assets/login.riv';

  Artboard? artboard;

  late StateMachineController? stateMachineController;

  late SMITrigger failTrigger, successTrigger;

  late SMIBool isChecking, isHandsUp;

  late SMINumber lookNum;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_name');
      print('Email: $_email');
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

  login() {
    isHandsUp.change(false);
    isChecking.change(false);
    if (_email == "admin" || _name == 'admin') {
      successTrigger.fire();
    } else {
      failTrigger.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              CustomTextField(
                hint: "İsminizi giriniz",
                icon: Icon(Icons.verified_user),
                onSaved: (String? input) {
                  _password = input;
                },
                validator: (String? value) {
                  return validateUserName(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                icon: Icon(Icons.email),
                hint: "Lütfen Email adresinizi giriniz  (custom)",
                validator: (value) => validateEmailAddress(value),
                onSaved: (value) => _name = value!,
                moveEyes: moveEyes,
                checking: checking,
              ),
              TextFormField(
                onTap: checking,
                //move eyes
                onChanged: ((value) => moveEyes(value)),
                //move eyes
                decoration: InputDecoration(
                  labelText: 'Email adresinizi giriniz :',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  return validateEmailAddress(value);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: handsUp,
                decoration: InputDecoration(
                    labelText: 'Şifrenizi belirleyiniz:',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    border: OutlineInputBorder()),
                onSaved: (value) {
                  _email = value!;
                },
                validator: (value) {
                  return validatePassword(value);
                },
              ),
              //date time
              Text(
                'Seçilen tarih:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${selectedDate.toLocal()}'.split(' ')[0],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Doğum tarihinizi seçiniz'),
              ),
              //end of region date time
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("it is wokring");
                  }
                  _submitForm();
                  login();
                  print(selectedDate);
                },
                child: Text('Login'),
              ),
              filledButton(
                "Kullanıcı Oluştur",
                Colors.white38,
                Colors.black12,
                Colors.black45,
                Colors.white,
                () {},
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
