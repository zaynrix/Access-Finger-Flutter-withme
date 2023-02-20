import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod/riverpod.dart';

final counterProvider = StateNotifierProvider((ref) {
  return LocalAuthenticationService();
});

class LocalAuthenticationService extends StateNotifier {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;

  LocalAuthenticationService() : super();

  Future<void> authenticate() async {
    try {
      isAuthenticated = await _auth.authenticate(
        localizedReason: 'authenticate to access',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      this.state = true;
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
