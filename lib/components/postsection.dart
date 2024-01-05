import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

// ignore: must_be_immutable
class PostContainer extends StatefulWidget {
  final String username;
  final String userImage;
  List<String>? postimage;
  final String caption;
  PostContainer(
      {super.key,
      required this.username,
      required this.userImage,
      this.postimage,
      required this.caption});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 19, 19, 19),
          borderRadius: BorderRadius.circular(7)),
      width: double.infinity,
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey.shade900,
                backgroundImage: NetworkImage(widget.userImage),
                radius: 20),
            s10,
            TextButton(
                onPressed: () {},
                child: Text(
                  widget.username,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                )),
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image.png"),fit: BoxFit.contain),
                  color: Colors.white),
            ),
            s50,
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        s10,
        Text(
          widget.caption,
          style: GoogleFonts.inter(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        )
      ]),
    );
  }
}
