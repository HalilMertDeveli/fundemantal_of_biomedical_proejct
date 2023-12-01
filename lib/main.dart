import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/firebase_options.dart';
import 'package:fundemetals_of_biomedical/pages/page_from_login.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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


