import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/anim_and_pages/bear_register_animation.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        
        backgroundColor: Colors.white,
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
