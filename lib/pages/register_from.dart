import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/login_anim/bear_register_animation.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap oluştur"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BearRegisterAnimation(),
          ],
        ),
      ),
    );
  }
}
