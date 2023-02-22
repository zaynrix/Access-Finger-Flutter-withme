import 'package:accesswithfinger/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'localAuthinticationsService.dart';

void main() {
  setupLocator();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: sl<LocalAuthenticationService>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Touch ID Checker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final LocalAuthenticationService _localAuth =
      sl<LocalAuthenticationService>();

  Widget _submitButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: firstColor,
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: const Text(
          'First Checker',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const Text(
          'Second Checker',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            const Text(
              'Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(Icons.fingerprint, size: 90, color: Colors.white),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => _localAuth.authenticate(context),
              child: const Text(
                'Check Touch ID',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Touch',
          //Touch ID Checker
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: const [
            TextSpan(
              text: 'ID',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Checker',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Color firstColor = Color(0xff494C9E);
  Color secondColor = Color(0xff31347C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocalAuthenticationService>(
        builder: (context, provider, child) => Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [firstColor, secondColor])),
              child: Stack(
                children: [
                  !provider.loading
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _title(),
                            const SizedBox(
                              height: 80,
                            ),
                            _submitButton(),
                            const SizedBox(
                              height: 20,
                            ),
                            _signUpButton(),
                            const SizedBox(
                              height: 20,
                            ),
                            _label()
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
            )
            //   )
            // Center(child: Container(color: Colors.red, child: _label())),
            // if (provider.loading)
            // const Opacity(
            //   opacity: 0.8,
            //   child: ModalBarrier(dismissible: false, color: Colors.black),
            // ),
            // if (provider.loading)

            // !provider.loading
            //     ?
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   height: MediaQuery.of(context).size.height,
            //   decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(Radius.circular(5)),
            //       boxShadow: <BoxShadow>[
            //         BoxShadow(
            //             color: Colors.grey.shade200,
            //             offset: const Offset(2, 4),
            //             blurRadius: 5,
            //             spreadRadius: 2)
            //       ],
            //       gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [firstColor, secondColor])),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       _title(),
            //       const SizedBox(
            //         height: 80,
            //       ),
            //       _submitButton(),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       _signUpButton(),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       _label()
            //     ],
            //   ),
            // )
            // : Center(
            //     child: Container(
            //         child: CircularProgressIndicator(
            //           color: Colors.red,
            //         ),
            //         width: 32,
            //         height: 32),
            //   )
            // : Center(child: Text("")),
          ],
        ),
      ),
    );
  }
}
