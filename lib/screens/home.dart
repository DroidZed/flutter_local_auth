import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/home.jpg",
            scale: 0.1,
          ),
          const Text("You're home !"),
        ],
      )),
    );
  }
}
