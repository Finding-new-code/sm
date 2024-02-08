import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/HomePage/widgets/h.dart';
import '../../../components/failure.dart';
import '../../../components/profilestack.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../ChatPage/chatpage.dart';
import '../../Postcreation/View/postcreation.dart';
import '../../PremiumPage/premiumpage.dart';
import '../../ProfilePage/View/profilepage.dart';
import '../../SettingsPage/Views/settings_page.dart';
import '../bloc/home_bloc.dart';

// ignore: must_be_immutable
/// This is the homepage of the application
class HomePage extends StatefulWidget {
  final bool isdark;
  const HomePage({
    super.key,
    required this.isdark,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetNewPosts());
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is HomeError) {
          errorbottomsheet(context, state.message);
        }
        if (state is HomeLoading) {
          const CircularProgressIndicator.adaptive();
        }
      },
      builder: (context, state) {
        return Scaffold(

            /// here the navigation bar which placed in the bottom of the screen
            /// shows you the options
            bottomNavigationBar: NavigationBar(
              height: 50,
              selectedIndex: 0,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                IconButton(
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    selectedIcon: Icon(
                      Icons.search_outlined,
                      color: Theme.of(context).primaryColor,
                      fill: 1.0,
                      weight: 2.0,
                      opticalSize: 2.0,
                    ),
                    isSelected: true,
                    icon: Icon(
                      Icons.search_outlined,
                      color: Theme.of(context).primaryColor,
                      fill: 1.0,
                      weight: 5.0,
                      opticalSize: 2.0,
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(1);
                    },
                    icon: Badge(
                      backgroundColor: Colors.deepPurpleAccent,
                      largeSize: 20.0,
                      smallSize: 10.0,
                      label: const Text("new"),
                      child: Icon(
                        Icons.messenger_outline_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: Badge(
                      backgroundColor: Colors.deepPurpleAccent,
                      largeSize: 20.0,
                      smallSize: 10.0,
                      label: const Text("new"),
                      child: Icon(
                        Icons.notification_add_outlined,
                        color: Theme.of(context).primaryColor,
                        fill: 1.0,
                        weight: 5.0,
                        opticalSize: 2.0,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(3);
                    },
                    selectedIcon: Icon(
                      Icons.home_filled,
                      color: Theme.of(context).primaryColor,
                      fill: 1.0,
                      weight: 5.0,
                      opticalSize: 2.0,
                    ),
                    icon: Icon(
                      Icons.star_border_purple500_outlined,
                      color: Theme.of(context).primaryColor,
                      fill: 1.0,
                      weight: 5.0,
                      opticalSize: 2.0,
                    )),
              ],
            ),

            /// backgroundColor: isdark ? Colors.black : Colors.white,
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          const NetworkImage("https://picsum.photos/200/300"),
                      backgroundColor: Colors.grey.shade500,
                      radius: 1,
                    ),
                  );
                }),
              ),
              scrolledUnderElevation: 50.0,
              backgroundColor: widget.isdark ? Colors.black : Colors.white,
              automaticallyImplyLeading: false,
              title: Text(
                "Explore",
                style: GoogleFonts.inter(
                    fontSize: 19, fontWeight: FontWeight.bold),
              ),
              forceMaterialTransparency: true,
            ),

            /// here the side drawer codes =>
            drawer: Drawer(
              child: Column(
                children: [
                  s10,
                  // profile stack image which is in the drawer
                  const ProfileStackImage(
                    profileimage: '',
                    bannerimage: '',
                  ),
                  s10,
                  // name of the user
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: Text(
                      "Satya Prakash Nayak",
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
                        "100 Following",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                      ),
                      s10,
                      Text(
                        "100 Followers",
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  s10,
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
                            builder: (context) => const ProfilePage())),
                  ),
                  ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PremiumPage())),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
                              backgroundColor: Colors.white,
                              useSafeArea: true,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                        style: GoogleFonts.inter(fontSize: 20)),
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
                                          value = widget.isdark;
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
                          icon: widget.isdark
                              ? const Icon(
                                  Icons.sunny,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.dark_mode,
                                  size: 35,
                                )),
                    ],
                  )
                ],
              ),
            ),

            /// here the body of the homepage
            body: Stack(children: [
              IndexedStack(
                index: _selectedIndex,
                children: bottomnav,
              ),
              Positioned(
                bottom: 15,
                left: 290,
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostCreationPage())),
                  child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/add_button.png"),
                            scale: 100.0,
                            isAntiAlias: true,
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                      child: const SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ]));
      },
    );
  }

  // this is the bottom navigation bar =>
  static const List<Widget> bottomnav = [
    PostList(isdark: true),
    Text('Search Page'),
    ChatListScreen(),
    Text('Notification Page')
  ];
  // this is the bottom navigation bar =>
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
