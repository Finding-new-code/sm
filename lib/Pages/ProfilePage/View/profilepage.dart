import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/components/dialog.dart';
import '../../../components/capsulebuttonbar.dart';
import '../../../components/descrpition.dart';
import '../../../components/postsection.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../../src/src.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;
  const ProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          showErrorDialog("something went erong", context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                  top: 140,
                  left: 260,
                  child: Offstage(
                    offstage: widget.user.userid
                            .contains(Caches().get('userId').toString())
                        ? false
                        : true,
                    child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProfileBloc>()
                              .add(FollowUser(widget.user));
                        },
                        child: Text(
                          'follow',
                          style: GoogleFonts.inter(
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        )),
                  )),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    s10,
                    Animate(
                        effects: const [FadeEffect()],
                        child: ProfileStackImage(
                          profileimage: widget.user.profilePicture,
                          bannerimage: widget.user.bannerPicture,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 13),
                      child: Text(
                        widget.user.name.isNotEmpty
                            ? widget.user.name
                            : "lonewolf",
                        style: GoogleFonts.inter(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        s25,
                        Text(
                          widget.user.following.isNotEmpty
                              ? "${widget.user.following.length} Following "
                              : "0 Following",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                        s10,
                        Text(
                          widget.user.followers.isNotEmpty
                              ? "${widget.user.followers.length} Followers"
                              : "0 Followers",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    s10,
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: DescriptionTile(
                        location: widget.user.location.isNotEmpty
                            ? widget.user.location
                            : "location",
                        descrpition: widget.user.bio.isNotEmpty
                            ? widget.user.bio
                            : "bio",
                      ),
                    ),
                    s10,
                    if (state is UserPosts)
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          cacheExtent: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return PostContainer(
                                post: state.posts[index], user: widget.user);
                          },
                          itemCount: state.posts.length)
                  ],
                ),
              ),
              Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black38),
                        shape: WidgetStatePropertyAll(CircleBorder()),
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
      },
    );
  }
}
