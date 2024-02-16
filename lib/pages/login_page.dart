import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
      ),
      body: Column(
        children: [
          Text(
            "Musa Develi",
            style: TextStyle(
              fontFamily: "BungeeSpice",
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
