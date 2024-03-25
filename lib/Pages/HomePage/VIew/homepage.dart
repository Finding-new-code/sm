import 'package:flutter/material.dart';
import '../../../components/failure.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../ChatPage/chatpage.dart';
import '../../PremiumPage/premiumpage.dart';
import '../../ProfilePage/View/profilepage.dart';
import '../../ProfilePage/bloc/profile_bloc.dart';
import '../../SettingsPage/Views/settings_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/h.dart';
import '../widgets/notfication_view.dart';
import '../widgets/search_view.dart';

/// This is the homepage of the application
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchCurrentUserData());
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
     ////
        if (state is HomeError) {
          errorbottomsheet(context, state.message);
        }
        if (state is HomeLoading) {
          const CircularProgressIndicator.adaptive();
        }
      },
      builder: (context, state) {
        return Scaffold(

            ///
            /// here the navigation bar which placed in the bottom of the screen
            /// shows you the options
            bottomNavigationBar: NavigationBar(
              animationDuration: const Duration(seconds: 1),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 50,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                IconButton(
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    icon: const Badge(
                      backgroundColor: Colors.deepPurpleAccent,
                      largeSize: 20.0,
                      smallSize: 10.0,
                      label: Text("new"),
                      child: Icon(
                        Icons.home_outlined,
                        size: 33,
                        fill: 1.0,
                        weight: 5.0,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(1);
                    },
                    selectedIcon: const Icon(
                      Icons.search_outlined,
                      fill: 1.0,
                      size: 30,
                      weight: 2.0,
                      opticalSize: 2.0,
                    ),
                    isSelected: true,
                    icon: const Icon(
                      Icons.search_outlined,
                      fill: 1.0,
                      size: 30,
                      weight: 5.0,
                      opticalSize: 2.0,
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: const Badge(
                      backgroundColor: Colors.deepPurpleAccent,
                      largeSize: 20.0,
                      smallSize: 10.0,
                      label: Text("new"),
                      child: Icon(
                        Icons.notification_add_outlined,
                        fill: 1.0,
                        size: 30,
                        weight: 5.0,
                        opticalSize: 2.0,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(3);
                    },
                    selectedIcon: const Icon(
                      Icons.home_filled,
                      fill: 1.0,
                      weight: 5.0,
                      size: 30,
                      opticalSize: 2.0,
                    ),
                    icon: const Icon(
                      Icons.star_border_purple500_outlined,
                      fill: 1.0,
                      size: 30,
                      weight: 5.0,
                      opticalSize: 2.0,
                    )),
              ],
            ),

            /// here the app bar which placed in the top of the screen
            /// shows you the options
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    if (state is ProfileLoaded) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                          backgroundImage: state
                                  .profile.profilePicture.isNotEmpty
                              ? NetworkImage(state.profile.profilePicture)
                              : const NetworkImage("https:picsum.photos/200"),
                          backgroundColor: Colors.grey.shade500,
                          radius: 1,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              scrolledUnderElevation: 50.0,
              automaticallyImplyLeading: false,
              title: Text(
                _selectedIndex == 0
                    ? "Explore"
                    : _selectedIndex == 1
                        ? "Find"
                        : _selectedIndex == 2
                            ? "Notifications"
                            : "Messaging",
                style: GoogleFonts.inter(
                    fontSize: 19, fontWeight: FontWeight.bold),
              ),
              forceMaterialTransparency: true,
            ),

            /// here the side drawer codes =>
            drawer: Drawer(
              child: Builder(builder: (context) {
                final state =
                    context.watch<ProfileBloc>().state as ProfileLoaded;
                return Column(
                  children: [
                    s10,
                    // profile stack image which is in the drawer
                    ProfileStackImage(
                      profileimage: state.profile.profilePicture,
                      bannerimage: state.profile.bannerPicture,
                    ),
                    s10,
                    // name of the user
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Text(
                        state.profile.name,
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    s10,
                    // following and followers

                    Row(
                      children: [
                        s25,
                        Text(
                          "${state.profile.following.length} Following",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                        s10,
                        Text(
                          " ${state.profile.followers.length} followers",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    s10,
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      leading: const Icon(Icons.person_2_outlined),
                      title: Text(
                        "Profile",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      /// this will takes you to the profile page
                      /// you may call it profile page
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    post: state.posts,
                                    user: state.profile,
                                  ))),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PremiumPage()));
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      leading: const Icon(Icons.lock_outline_rounded),
                      title: Text(
                        "Premium",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage())),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      leading: const Icon(Icons.settings_outlined),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height - 500,
                    ),

                    /// here the dark button
                    // TODO: state isn't updated
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                useSafeArea: true,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      s10,
                                      const Icon(
                                        Icons.dark_mode_rounded,
                                        size: 30,
                                        fill: 1.0,
                                        opticalSize: 2.0,
                                        weight: 2.0,
                                      ),
                                      s10,
                                      Text("Choose your theme",
                                          style:
                                              GoogleFonts.inter(fontSize: 20)),
                                      s10,
                                      Text("Choose your theme which you like",
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                          )),
                                      s10,
                                      RadioListTile.adaptive(
                                        value: 1,
                                        groupValue: "",
                                        onChanged: (value) {
                                          setState(() {
                                            // value = widget.isdark;
                                          });
                                        },
                                        title: Text(
                                          "light",
                                          style: GoogleFonts.inter(),
                                        ),
                                        subtitle: Text(
                                          "better for your eyes during daytime",
                                          style: GoogleFonts.hankenGrotesk(
                                              fontSize: 13),
                                        ),
                                      ),
                                      RadioListTile.adaptive(
                                        value: 1,
                                        groupValue: "",
                                        onChanged: (value) {},
                                        title: Text(
                                          "Use System settings",
                                          style: GoogleFonts.inter(),
                                        ),
                                        subtitle: Text(
                                          "let system decide the theme",
                                          style: GoogleFonts.hankenGrotesk(
                                              fontSize: 13),
                                        ),
                                      ),
                                      RadioListTile.adaptive(
                                        value: 1,
                                        groupValue: "",
                                        onChanged: (value) {},
                                        title: Text(
                                          "Dark",
                                          style: GoogleFonts.inter(),
                                        ),
                                        subtitle: Text(
                                          "better for your mood during night",
                                          style: GoogleFonts.hankenGrotesk(
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                context: context,
                              );
                            },
                            icon:
                                //  widget.isdark
                                // ?
                                const Icon(
                              Icons.sunny,
                              size: 30,
                            )
                            // : const Icon(
                            //     Icons.dark_mode,
                            //     size: 35,
                            //   )
                            ),
                      ],
                    )
                  ],
                );
              }),
            ),

            /// here the body of the homepage
            body: IndexedStack(
              index: _selectedIndex,
              children: bottomnav,
            ));
      },
    );
  }

  // this is the bottom navigation bar =>
  static List<Widget> bottomnav = [
    PostList(),
    const SearchView(),
    const NotificationView(),
    const ChatListScreen(),
  ];
  // this is the bottom navigation bar =>
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
