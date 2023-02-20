import 'package:accesswithfinger/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localAuthinticationsService.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: sl<LocalAuthenticationService>(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final LocalAuthenticationService _localAuth =
      sl<LocalAuthenticationService>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.ac_unit),
        ),
        title: const Text('Local Authentication'),
      ),
      body: Consumer(
        builder: (context, LocalAuthenticationService value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("This data locator ${_localAuth.isAuthenticated}"),
            ),
            Center(
              child: TextButton(
                onPressed: _localAuth.authenticate,
                child: Text('authenticate ${_localAuth.isAuthenticated}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
