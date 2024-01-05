import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ChatPage/chatpage.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ProfilePage/profilepage.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

// here the chat tile to show the basic chat user info
// ignore: must_be_immutable
class ChatTile extends StatelessWidget {
  final String name;
   String? lastmessage;
   String? time;
  final String image;
  // final bool isActive;
   ChatTile({
    Key? key,
    required this.name, this.lastmessage, this.time, required this.image, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage())),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white38,
                    image: DecorationImage(image: NetworkImage(image))),
              ),
            ),
            s25,
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatView())),
              child: Text(
                name,
                style: GoogleFonts.inter(fontSize: 15),
              ),
            ),
            s10,
            s10,
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatView())),
              child: Text(
                "12:00",
                style: GoogleFonts.inter(fontSize: 12),
              ),
            ),
            s5,
            
            s5
          ],
        ),Text(
              lastmessage.toString(),
              style: GoogleFonts.inter(fontSize: 13),
            ),
      ],
    );
  }
}
