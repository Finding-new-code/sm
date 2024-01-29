
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/ChatPage/chatpage.dart';
import '../Pages/ProfilePage/View/profilepage.dart';

// here in the approch i will make a capsule shape button bar which hover
// approx 50 px above from the bottom

class CapsuleStyleButtonBar extends StatelessWidget {
  const CapsuleStyleButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.teal.shade400,
              Colors.cyan.shade500,
              Colors.blueGrey,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatListScreen()));
              },
              child: Text(
                "chat",
                style: GoogleFonts.inter(
                    color: Colors.white, fontWeight: FontWeight.w400),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: VerticalDivider(
              color: Colors.blue.shade600,
              thickness: 2,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: Text(
                "profile",
                style: GoogleFonts.inter(color: Colors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: VerticalDivider(
              color: Colors.blue.shade600,
              thickness: 2,
            ),
          ),
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
