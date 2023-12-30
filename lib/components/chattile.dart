import 'package:flutter/material.dart';


import '../constants/constant.dart';
import '../constants/tools.dart';

// here the chat tile to show the basic chat user info
class ChatTile extends StatelessWidget {
  // final String name;
  // final String message;
  // final String time;
  // final String image;
  // final bool isActive;
  const ChatTile({Key? key, /*required this.name, required this.message, required this.time, required this.image, required this.isActive*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white38),
            ),
            s10,
            Text("ronny",style: GoogleFonts.inter(fontSize: 10),)
          ],
        ),
        s10,
        Text("hello",style: GoogleFonts.inter(fontSize: 10),)
      ],
    );
  }
}
