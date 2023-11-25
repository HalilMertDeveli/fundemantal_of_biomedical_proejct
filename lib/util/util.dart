import 'package:flutter/material.dart';

void navigatePage(BuildContext context, Widget pageName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageName,
    ),
  );
}
