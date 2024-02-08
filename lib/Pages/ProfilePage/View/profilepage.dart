import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ProfilePage/bloc/profile_bloc.dart';
import 'package:myapp658d7b3746ed317621f8/components/failure.dart';
import '../../../components/capsulebuttonbar.dart';
import '../../../components/descrpition.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

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
            title: Text(
              "Profile",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: 
          Column(
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
                  state is ProfileLoaded ? state.profile.userid : "lonewolf",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
              ,
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
                child: DescriptionTile(location: state is ProfileLoaded ? state.profile.location : "location",
               descrpition: state is ProfileLoaded ? state.profile.bio : "",),
              ),
              s10,
              Offstage(
                offstage: state is ProfileLoaded ? state.profile.posts.isEmpty : true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 5,
                    cacheExtent: 5,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.grey.shade200,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        color: Colors.grey.shade200,
                      )
                    ],
                  ),
                ),
              )
            ],
             
          ),
        );
      },
    );
  }
}
