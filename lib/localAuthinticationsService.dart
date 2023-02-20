import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService extends ChangeNotifier {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;

  Future<void> authenticate() async {
    try {
      isAuthenticated = await _auth.authenticate(
        localizedReason: 'authenticate to access',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      notifyListeners();
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
