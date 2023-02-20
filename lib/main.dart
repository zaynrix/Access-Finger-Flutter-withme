import 'package:accesswithfinger/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'localAuthinticationsService.dart';

void main() {
  setupLocator();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final LocalAuthenticationService _localAuth =
      sl<LocalAuthenticationService>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.ac_unit),
        ),
        title: const Text('Local Authentication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("This data locator ${_localAuth.isAuthenticated}"),
          ),
          Center(
            child: TextButton(
              onPressed: _localAuth.authenticate,
              child: Text('authenticate ${count.toString()}'),
            ),
          ),
        ],
      ),
    );
  }
}
