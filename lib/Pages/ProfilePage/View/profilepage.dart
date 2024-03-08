import 'package:flutter/material.dart';
import '../../../components/capsulebuttonbar.dart';
import '../../../components/descrpition.dart';
import '../../../components/postsection.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../../src/scr.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;
  final List<Post> post;
  const ProfilePage({Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
              top: 140,
              left: 260,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'following',
                    style: GoogleFonts.inter(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ))),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                s10,
                Animate(
                    effects: const [FadeEffect()],
                    child: ProfileStackImage(
                      profileimage: user.profilePicture,
                      bannerimage: user.bannerPicture,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                  child: Text(
                    user.name.isNotEmpty ? user.name : "lonewolf",
                    style: GoogleFonts.inter(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    s25,
                    Text(
                      user.following.isNotEmpty
                          ? "${user.following.length} Following "
                          : "0 Following",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    s10,
                    Text(
                      user.followers.isNotEmpty
                          ? "${user.followers.length} Followers"
                          : "0 Followers",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                s10,
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: DescriptionTile(
                    location:
                        user.location.isNotEmpty ? user.location : "location",
                    descrpition: user.bio.isNotEmpty ? user.bio : "bio",
                  ),
                ),
                s10,
                Offstage(
                  offstage: post.isEmpty ? true : false,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      cacheExtent: 5,
                      itemBuilder: (BuildContext context, int index) {
                        if (post.isNotEmpty) {
                          return PostContainer(post: post[index], user: user);
                        } else {
                          return Text(
                            'No posts yet',
                            style: GoogleFonts.inter(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          );
                        }
                      },
                      itemCount: post.length),
                )
              ],
            ),
          ),
          Positioned(
              top: 30,
              left: 10,
              child: IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black38),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back))),
          const Positioned(
            top: 590,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
              child: CapsuleStyleButtonBar(),
            ),
          )
        ],
      ),
    );
  }
}
