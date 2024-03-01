import 'package:flutter/material.dart';
import '../Pages/HomePage/bloc/home_bloc.dart';
import '../Pages/HomePage/widgets/comment_bottombar.dart';
import '../Pages/HomePage/widgets/more.dart';
import '../Pages/ProfilePage/View/profilepage.dart';
import '../constants/constant.dart';
import '../constants/tools.dart';
import '../src/modals/post.dart';
import '../src/modals/usermodel.dart';
import '../src/share.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostContainer extends StatefulWidget {
  final Post post;
  final UserModel user;
  const PostContainer({super.key, required this.post, required this.user});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                backgroundImage: NetworkImage(
                    widget.user.profilePicture.isNotEmpty
                        ? widget.user.profilePicture
                        : 'https://picsum.photos/200/300'),
                radius: 17),
            s5,
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: Text(
                  widget.user.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w700),
                )),
            Offstage(
              offstage: widget.user.isPremium,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      isAntiAlias: true,
                      image: AssetImage("assets/images/verify.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            s25,
            Text(timeago.format(widget.post.createdAt, locale: 'en_short')),
            const Spacer(),
            IconButton(
                onPressed: () =>
                    moreoptionBottomSheet(context, widget.post.postid, () {
                      context.read<HomeBloc>().add(DeletePost(widget.post));
                    }, () {/* TODO: edit post */}),
                icon: const Icon(Icons.more_vert))
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
              Offstage(
                  offstage: widget.post.imageLinks.isEmpty,
                  child: GridView.builder(
                      primary: true,
                      // scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.post.imageLinks.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              widget.post.imageLinks.length == 1 ? 1 : 2,
                          mainAxisExtent:
                              widget.post.imageLinks.length == 1 ? 200 : 100,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: 'image',
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ImageScreen(
                                        image: widget.post.imageLinks[index]))),
                            child: Container(
                              width: 100,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          widget.post.imageLinks.length == 1
                                              ? 20
                                              : 10),
                                      topRight: Radius.circular(
                                          widget.post.imageLinks.length == 1
                                              ? 0
                                              : 10),
                                      bottomLeft: Radius.circular(
                                          widget.post.imageLinks.length == 1
                                              ? 0
                                              : 10),
                                      bottomRight: Radius.circular(
                                          widget.post.imageLinks.length == 1
                                              ? 20
                                              : 10)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        widget.post.imageLinks[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey.shade400),
                            ),
                          ),
                        );
                      }))
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

class ImageScreen extends StatelessWidget {
  final String image;
  const ImageScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actionsIconTheme: const IconThemeData(color: Colors.amber),
        title: const Text('Image', style: TextStyle(color: Colors.white)),
      ),
      body: Hero(
          tag: 'image',
          child:
              Expanded(child: InteractiveViewer(child: Image.network(image)))),
    );
  }
}
