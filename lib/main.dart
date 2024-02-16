import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/firebase_options.dart';
import 'package:fundemetals_of_biomedical/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
