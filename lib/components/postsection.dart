import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/HomePage/widgets/comment_bottombar.dart';
import 'package:myapp658d7b3746ed317621f8/src/modals/post.dart';
import 'package:myapp658d7b3746ed317621f8/src/share.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

// ignore: must_be_immutable
class PostContainer extends StatefulWidget {
   final Post post;
  const PostContainer({
    super.key,
   required this.post
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey.shade900.withOpacity(0.2),
                backgroundImage: const NetworkImage('https://picsum.photos/200/300'),
                radius: 17),
            s5,
            TextButton(
                onPressed: () {},
                child: Text(
                  'satya',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                )),
            Offstage(
              offstage: true,
              child: Container(
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
                widget.post.posttext,
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
              if (widget.post.imageLinks.isNotEmpty)
              GridView.builder(
                  primary: true,
                  // scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1),
                  itemBuilder: (context, index)  {
                    
                    return Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              ///TODO: here network image implement to watch over in to the post image
                              image: NetworkImage(widget.post.imageLinks[index]),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey.shade400),
                      );
                  })
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
                onPressed: () {
                  commentbottomsheet(context);
                },
                icon: const Icon(
                  Icons.comment_outlined,
                  size: 18,
                )),
            s25,
            IconButton(
                onPressed: () {
                  share(
                    widget.post.posttext,
                  );
                },
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
