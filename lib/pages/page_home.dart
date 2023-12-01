import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundemetals_of_biomedical/service_firebase/service_auth.dart';

class PageHome extends StatelessWidget {
  PageHome({super.key});

  ServiceAuth _serviceAuth = new ServiceAuth();
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          Text("Home Page")
        ],
      ),
    );
  }
}
