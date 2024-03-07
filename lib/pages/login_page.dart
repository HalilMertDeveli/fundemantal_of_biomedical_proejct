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
          Align(
            alignment: Alignment(0.1, 0.6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Clicked to google");
                  },
                  child: Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 241, 241, 241),
                      ),
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                        bottom: 8,
                      ), // Add padding to create space for the image
                      child: Container(
                        child: Image.asset(
                          "lib/assets/icons/login_singup_icons/google.png",
                          width: 80,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Cliked facebook");
                  },
                  child: Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 241, 241, 241),
                      ),
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                        bottom: 8,
                      ), // Add padding to create space for the image
                      child: Container(
                        child: Image.asset(
                          "lib/assets/icons/login_singup_icons/facebook (1).png",
                          width: 80,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Clicked twitter");
                  },
                  child: Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(255, 241, 241, 241),
                      ),
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 8,
                        bottom: 8,
                      ), // Add padding to create space for the image
                      child: Container(
                        child: Image.asset(
                          "lib/assets/icons/login_singup_icons/twitter.png",
                          width: 80,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
