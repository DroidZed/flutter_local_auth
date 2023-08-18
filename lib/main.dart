import 'package:flutter/material.dart';
import 'package:flutter_local_auth/screens/auth.dart';
import 'package:flutter_local_auth/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthScreen(),
      routes: {
        "/home": (BuildContext context) => const HomeScreen(),
      },
      title: "Local Auth Test",
    );
  }
}
