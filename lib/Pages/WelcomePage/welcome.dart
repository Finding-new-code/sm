import 'package:flutter/material.dart';

import '../../constants/tools.dart';
import '../AuthPage/authpage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [
        Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage("assets/images/slide1.png"),
                    fit: BoxFit.fitHeight)),
            child: const Text("hi satya prakash nayak"),
          ),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                    image: AssetImage("assets/images/slide2.png"),
                    fit: BoxFit.fitHeight)),
            child: const Text("hi satya prakash nayak"),
          ),
        ),
        Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    image: AssetImage("assets/images/slide3.png"),
                    fit: BoxFit.fitHeight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()),
                            (route) => false);
                      },
                      label: Text(
                        "Let's begin",
                        style: GoogleFonts.inter(),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
