import 'package:flutter/material.dart';

import '../../components/capsulebuttonbar.dart';
import '../../components/descrpition.dart';
import '../../components/profilestack.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
        child: CapsuleStyleButtonBar(),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
         Animate(
          effects: const [FadeEffect()],
          child: const ProfileStackImage()),
          Text(
            "satya Prakash Nayak",
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),s25,
          const Padding(
            padding: EdgeInsets.only(left: 13,right: 13),
            child: DescriptionTile(),
          ),
          s10,
        ],
      ),
    );
  }
}
