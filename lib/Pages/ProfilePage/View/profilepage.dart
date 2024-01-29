import 'package:flutter/material.dart';
import '../../../components/capsulebuttonbar.dart';
import '../../../components/descrpition.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
        child: CapsuleStyleButtonBar(),
      ),
      appBar: AppBar(
  
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
               fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Animate(
          effects: const [FadeEffect()],
          child: const ProfileStackImage()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 13),
            child: Text(
              "satya Prakash Nayak",
              style: GoogleFonts.inter(
                   fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),s10,
          const Padding(
            padding: EdgeInsets.only(left: 13,right: 13),
            child: DescriptionTile(),
          ),
          s10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 5,
              cacheExtent: 5,
              children: [
                Container(width: 10,height: 10,color: Colors.grey.shade200,),
                Container(width: 10,height: 10,color: Colors.grey.shade200,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
