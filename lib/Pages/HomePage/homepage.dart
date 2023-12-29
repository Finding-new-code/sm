import 'package:flutter/material.dart';
import 'package:myapp/components/capsulebuttonbar.dart';
import 'package:myapp/constants/tools.dart';

import '../../constants/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Home",
            style: GoogleFonts.inter(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 40, left: 40),
            child: SearchBar(),
          ),
          Container(),
          const Padding(
            padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 10),
            child: CapsuleStyleButtonBar(),
          )
        ],
      ),
    );
  }
}
