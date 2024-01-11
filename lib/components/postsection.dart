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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          // color: Colors.deepPurpleAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(7)),
      width: double.infinity,
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey.shade900.withOpacity(0.2),
                backgroundImage: NetworkImage(widget.userImage),
                radius: 17),
            s5,
            TextButton(
                onPressed: () {},
                child: Text(
                  widget.username,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                )),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(isAntiAlias: true,
                      image: AssetImage("assets/images/verify.png"),fit: BoxFit.cover),
                 // color: Colors.white
                 ),
            ),
            s50,
            s10,
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          // ignore: avoid_unnecessary_containers
          child: Container(
            // color: Colors.black12,
            child: Text(
              widget.caption,
              style: GoogleFonts.inter(
                  fontSize: 15, fontWeight: FontWeight.w600,),
            ),
          ),
        )
      ]),
    );
  }
}
