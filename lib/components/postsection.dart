import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

// ignore: must_be_immutable
class PostContainer extends StatefulWidget {
  final String username;
  final String userImage;
  final List<String> postimage;
  final String caption;
  const PostContainer({
    super.key,
    required this.username,
    required this.userImage,
    required this.postimage,
    required this.caption,
  });

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 6),
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
                image: DecorationImage(
                    isAntiAlias: true,
                    image: AssetImage("assets/images/verify.png"),
                    fit: BoxFit.cover),
                // color: Colors.white
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.caption,
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
                textAlign: TextAlign.left,
                // textDirection: TextDirection.ltr,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                selectionColor: Theme.of(context).indicatorColor,
              ),
              s10,
              if (widget.postimage.isNotEmpty)
              GridView.builder(
                primary: true,
                 scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1),
                  itemBuilder: ((context, index) => Container(
                        width: 20,
                        height: 10,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300),
                      )))
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            s25,
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 18,
                )),
            s25,
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                  size: 18,
                )),
            s25,
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_rounded,
                  size: 18,
                )),
          ],
        )
      ]),
    );
  }
}
