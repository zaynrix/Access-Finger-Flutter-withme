import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'doneScreen.dart';

class LocalAuthenticationService extends ChangeNotifier {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;

  Future<void> authenticate(context) async {
    try {
      isAuthenticated = await _auth.authenticate(
        localizedReason: 'authenticate to access',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      notifyListeners();
      if (isAuthenticated == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoneScreen()));
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> remove() async {
    isAuthenticated = false;
    notifyListeners();
  }
}
