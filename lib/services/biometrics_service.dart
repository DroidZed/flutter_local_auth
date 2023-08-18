import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricsService {
  static final BiometricsService _instance = BiometricsService._internal();

  final LocalAuthentication auth = LocalAuthentication();

  factory BiometricsService() {
    return _instance;
  }

  BiometricsService._internal();

  Future<bool> checkForBiometricsSupport() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  Future<bool> getEnrolledBiometric(BiometricType biometricType) async =>
      (await auth.getAvailableBiometrics()).contains(biometricType);

  Future<bool> authenticateUser(String localizedReason) async {
    try {
      final bool didAuthenticate = await auth.authenticate(

        localizedReason: localizedReason,
        options: const AuthenticationOptions(

          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
          sensitiveTransaction: true,
        ),
      );
      return didAuthenticate;
    } on PlatformException {
      return false;
    }
  }
}
