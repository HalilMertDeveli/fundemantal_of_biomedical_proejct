import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "lib/assets/img/splash/Splash2x.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
