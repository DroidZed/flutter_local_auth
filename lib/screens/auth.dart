import 'package:flutter/material.dart';
import 'package:flutter_local_auth/wigets/button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/biometrics_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authService = BiometricsService();

  Future<void> _handleAuthClick() async {
    final isSupported = await authService.checkForBiometricsSupport();

    if (!isSupported) {
      await Fluttertoast.showToast(
        msg: "Your devices doesn't support biometric auth.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: const Color(0xFF972525),
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    final isAuthenticated = await authService
        .authenticateUser("We need your approval to access the application !");

    if (context.mounted) {
      if (!isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            showCloseIcon: true,
            content: Text(
              "Unable to verify your identity!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17
              ),
            ),
          ),
        );
        return;
      }
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Button(
          width: size.width * 0.55,
          color: Theme.of(context).colorScheme.primary,
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.fingerprint,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Authenticate",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          onPress: () async => await _handleAuthClick(),
        ),
      ),
    );
  }
}
