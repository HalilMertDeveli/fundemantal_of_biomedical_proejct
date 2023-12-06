import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {
  PageHome({super.key});


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
