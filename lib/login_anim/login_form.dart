import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/pages/register_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  BearStateless bearStateless = new BearStateless();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BearAnimation(),
            bearStateless.build(context)
          ],
        ),
      ),
    );
  }
}
