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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: FloatingActionButton.extended(onPressed: () {
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AuthPage()), (route) => false);
            }, label: Text("Let's begin",style: GoogleFonts.inter(),)),
          )
        ],
      ),
    );
  }
}