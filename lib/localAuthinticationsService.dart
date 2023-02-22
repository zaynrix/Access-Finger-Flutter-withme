import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'doneScreen.dart';

class LocalAuthenticationService extends ChangeNotifier {
  final _auth = LocalAuthentication();

  bool isAuthenticated = false;
  bool loading = false;

  Future<void> authenticate(context) async {
    try {
      isAuthenticated = await _auth.authenticate(
        localizedReason: 'authenticate to access',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (isAuthenticated == true) {
        loading = true;
        notifyListeners();
        Future.delayed(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DoneScreen()));
          loading = false;
          notifyListeners();
        });

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DoneScreen()));
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
