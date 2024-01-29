import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/constants/constant.dart';

import '../../constants/tools.dart';
import '../AuthPage/View/authpage.dart';

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
                  image: DecorationImage(
                      image: AssetImage("assets/images/slide1.png"),
                      fit: BoxFit.fill,
                      isAntiAlias: true)),
              child: Animate(
                effects: const [
                  FadeEffect(duration: Duration(milliseconds: 500),delay: Duration(milliseconds: 500) )
                ],
                child: Center(
                  child: Text(
                    "Welcome to\nthe Project SM",
                    style: GoogleFonts.hankenGrotesk(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        ),
        Center(
          child: Animate(
            effects: const [FadeEffect(duration: Duration(milliseconds: 500))],
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/slide2.png"),
                      fit: BoxFit.fill,
                      isAntiAlias: true)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  s25,
                  s10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "02",
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  s25,
                  Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 500))
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Text(
                        "How will we\nCommunicate \nin the future?",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.hankenGrotesk(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Animate(
          effects: const [FadeEffect(duration: Duration(milliseconds: 500))],
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/slide4.png"),
                      fit: BoxFit.fill,
                      isAntiAlias: true)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   s25,
                  s10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "02",
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ),s25,
                   Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: Text(
                        "Welcome to\nthe Project SM",
                        style: GoogleFonts.hankenGrotesk(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                   ),
                    s25,
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
                          style: GoogleFonts.hankenGrotesk(
                            fontWeight: FontWeight.w600
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
