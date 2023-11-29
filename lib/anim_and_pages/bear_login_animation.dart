import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundemetals_of_biomedical/pages/register_from.dart';
import 'package:fundemetals_of_biomedical/util/util.dart';
import 'package:rive/rive.dart';

class BearStateless extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Hesabınız yok mu ?",
        style: TextStyle(color: Colors.black,fontSize: 14),
        children: <TextSpan>[
          TextSpan(
            text: "Yeni üyelik açınız",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              navigatePage(context,RegisterForm());
            }
          ) 

        ]
      )
    );
  }

}

class BearLoginAnimation extends StatefulWidget {
  @override
  State<BearLoginAnimation> createState() => _BearLoginAnimationState();
}

class _BearLoginAnimationState extends State<BearLoginAnimation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = '';

  var animationLink = 'assets/login.riv';

  Artboard? artboard;

  late StateMachineController? stateMachineController;

  late SMITrigger failTrigger, successTrigger;

  late SMIBool isChecking, isHandsUp;

  late SMINumber lookNum;

  @override
  void initState() {
    super.initState();
    initArtboard();
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Name: $_password');
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

  checking() {
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
    if (_email == "admin" || _password == 'admin') {
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
              TextFormField(
                onTap: checking, //move eyes
                onChanged: ((value) => moveEyes(value)), //move eyes
                decoration: InputDecoration(
                  labelText: 'Email adresinizi giriniz :',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _password = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: handsUp,
                decoration: InputDecoration(
                    labelText: 'Şifrenizi giriniz :',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    border: OutlineInputBorder()),
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
              ElevatedButton(
              onPressed: () {
                _submitForm();
                login();
              },
              child: Text('Giriş Yap'),
            ),
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
