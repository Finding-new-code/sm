import 'package:flutter/material.dart';

import '../../components/capsulebuttonbar.dart';
import '../../components/profilestack.dart';
import '../../components/searchbar.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  const Padding(
            padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
            child: CapsuleStyleButtonBar(),
          ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Explore",
          style: GoogleFonts.inter(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              decoration: TextDecoration.overline),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        child: Column(
          children: [s10, ProfileStackImage()],
        ),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          s10,
          const Padding(
            padding: EdgeInsets.only(right: 40, left: 40),
            child: SearchBarNew(),
          ),
          Container(),
         
        ],
      ),
    );
  }
}
