import 'package:flutter/material.dart';

class PageBasicHome extends StatelessWidget {
  const PageBasicHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: const Text("Home page"),
      ),
    );
  }
}