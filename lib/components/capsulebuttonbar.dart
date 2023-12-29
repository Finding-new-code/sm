import "package:flutter/material.dart";
import "package:myapp/constants/constant.dart";
import "package:myapp/constants/tools.dart";
//import "package:sm/constants/constants.dart";


// here in the approch i will make a capsule shape button bar which hover
// approx 50 px above from the bottom

class CapsuleStyleButtonBar extends StatelessWidget {
  const CapsuleStyleButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle),
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "chat",
                style: GoogleFonts.inter(color: Colors.white),
              )),
          s10,
          TextButton(
              onPressed: () {},
              child: Text(
                "profile",
                style: GoogleFonts.inter(color: Colors.white),
              )),
          s10,
          TextButton(
              onPressed: () {},
              child: Text(
                "anything",
                style: GoogleFonts.inter(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
