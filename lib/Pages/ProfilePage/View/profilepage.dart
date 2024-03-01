import 'package:flutter/material.dart';
import '../../../components/capsulebuttonbar.dart';
import '../../../components/descrpition.dart';
import '../../../components/failure.dart';
import '../../../components/postsection.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(GetUserData());
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          errorbottomsheet(context, state.message);
        }

        if (state is ProfileLoading) {
          const CircularProgressIndicator.adaptive();
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
            child: CapsuleStyleButtonBar(),
          ),
          appBar: AppBar(
            elevation: 0,
            forceMaterialTransparency: true,
            title: Text(
              "Profile",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is ProfileLoaded)
                  Animate(
                      effects: const [FadeEffect()],
                      child: ProfileStackImage(
                        profileimage: state.profile.profilePicture,
                        bannerimage: state.profile.bannerPicture,
                      )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
                  child: Text(
                    state is ProfileLoaded ? state.profile.name : "lonewolf",
                    style: GoogleFonts.inter(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    s25,
                    Text(
                      "0 Following",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                    s10,
                    Text(
                      "0 Followers",
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                s10,
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  child: DescriptionTile(
                    location: state is ProfileLoaded
                        ? state.profile.location
                        : "location",
                    descrpition: state is ProfileLoaded ? state.profile.bio : "",
                  ),
                ),
                s10,
                Offstage(
                  offstage: state is ProfileLoaded ? state.posts.isEmpty : false,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    cacheExtent: 5,
                    itemBuilder: (BuildContext context, int index) {
                      if (state is ProfileLoaded) {
                        return PostContainer(
                            post: state.posts[index], user: state.profile);
                      } else {
                        return Text(
                          'No posts yet',
                          style: GoogleFonts.inter(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        );
                      }
                    },
                    itemCount: state is ProfileLoaded ? state.posts.length : 0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
