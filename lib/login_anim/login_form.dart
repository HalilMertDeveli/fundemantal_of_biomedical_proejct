import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_name');
      print('Email: $_email');
    }
  }

  //1-)we created trigger for animation
  var animationLink = 'assets/login.riv';
  Artboard? artboard;
  late StateMachineController? stateMachineController;


  late SMITrigger failTrigger, successTrigger;
  late SMIBool isChecking, isHandsUp;
  late SMINumber lookNum;

  //2-) We created init state
  @override
  void initState() {
    super.initState();
    initArtboard();
  }

  initArtboard() {
    rootBundle.load(animationLink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;

      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine")!;

      if (stateMachineController != null) {
        art.addController(stateMachineController!);
        for(var element in stateMachineController!.inputs){
          //print(element); -> we got animation trigger
          if(element.name == "isChecking"){
            isChecking = element as SMIBool;
          }
          else if(element.name == "isHandsUp"){
            isHandsUp = element as SMIBool;
          }
          else if(element.name == "trigSuccess"){
            successTrigger = element as SMITrigger;
          }
          else if(element.name == "trigFail"){
            failTrigger = element as SMITrigger;
          }
          else if(element.name == 'numLook'){
            lookNum = element as SMINumber;
          }

          
        }
      }
      setState(() {
        artboard = art;
      });
    });
  }

  checking(){
    isHandsUp.change(false);
    isChecking.change(true);
    lookNum.change(0);
  }
  moveEyes(value){
    lookNum.change(value.length.toDouble());
  }
  handsUp(){
    isHandsUp.change(true);
    isChecking.change(false);
  }
  login(){
    isHandsUp.change(false);
    isChecking.change(false);
    if (_email == "admin" || _name == 'admin') {
      successTrigger.fire();
    }else{
      failTrigger.fire();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (artboard != null)
                  SizedBox(
                    width: 400,
                    height: 350,
                    child: Rive(
                      artboard: artboard!,
                    ),
                  ),
                TextFormField(
                  onTap: checking,//move eyes
                  onChanged: ((value)=>moveEyes(value)),//move eyes
                  decoration: InputDecoration(labelText: 'Email adresinizi giriniz :',labelStyle: TextStyle(fontSize: 20,color: Colors.black),border: OutlineInputBorder(),),
                  onSaved: (value) {
                    _name = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  onTap: handsUp,
                  decoration: InputDecoration(labelText: 'Şifrenizi giriniz :',labelStyle: TextStyle(fontSize: 20.0,color: Colors.black),border: OutlineInputBorder()),
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } 
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    _submitForm();
                    login();
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
