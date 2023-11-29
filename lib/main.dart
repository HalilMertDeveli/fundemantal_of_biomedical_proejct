import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/pages/login_form.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen.gif(
        backgroundColor: Colors.white,
        gifPath: "assets/gifs/funny_cat.gif",
        gifWidth: double.infinity,
        gifHeight: double.infinity,
        
        nextScreen: LoginForm(),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      )
    ),
  );
}


