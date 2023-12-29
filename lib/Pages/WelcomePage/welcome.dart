import 'package:flutter/material.dart';
import 'package:myapp/Pages/AuthPage/authpage.dart';
import 'package:myapp/constants/tools.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FloatingActionButton.extended(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthPage()));
          }, label: Text("Let's begin",style: GoogleFonts.inter(),))
        ],
      ),
    );
  }
}