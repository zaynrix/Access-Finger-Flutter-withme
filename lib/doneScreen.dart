import 'package:accesswithfinger/localAuthinticationsService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({Key? key}) : super(key: key);

  Color firstColor = Color(0xff494C9E);
  Color secondColor = Color(0xff31347C);

  Widget _label(bool isPassed) {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isPassed ? 'Your touch ID ready to use' : "Your touch ID INVALID",
              style: GoogleFonts.portLligatSans(
                // textStyle:
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Icon(Icons.fingerprint, size: 120, color: Color(0xff39EEBB)),
            const SizedBox(
              height: 20,
            ),
            Text(
              isPassed ? '100%' : "0%",
              style: GoogleFonts.portLligatSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Scanning Completed',
              style: GoogleFonts.portLligatSans(
                // textStyle:
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   // } _localAuth.authenticate(context),
            //   child: const Text(
            //     'Check Touch ID',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 15,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ),
            // ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocalAuthenticationService>(
        builder: (context, value, child) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [firstColor, secondColor],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_label(value.isAuthenticated)],
            ),
          ),
        ),
      ),
    );
  }
}
