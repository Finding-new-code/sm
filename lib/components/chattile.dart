import 'package:flutter/material.dart';

import '../Pages/ChatPage/chatpage.dart';
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
    super.key,
    required this.name,
    this.lastmessage,
    this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(image),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            time.toString(),
            style: GoogleFonts.inter(
              fontSize: 10,
            ),
          )
        ],
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuzumeChat(
                    name: name,
                    image: image,
                    api: 'AIzaSyAkWsQ7VtGTlevdDT3TqNwkufcPe7HfV3Q',
                  ))),
      subtitle: Text(
        lastmessage.toString(),
        style: GoogleFonts.inter(
            fontSize: 13,
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
