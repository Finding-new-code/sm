import 'package:flutter/material.dart';
import '../../components/postsection.dart';
import '../../components/profilestack.dart';
import '../../components/searchbar.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';
import '../ProfilePage/profilepage.dart';

/// This is the homepage of the application
class HomePage extends StatelessWidget {
  final bool isdark;
  const HomePage({super.key, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Explore",
          style: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),

      /// here the side drawer codes =>
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        child: Column(
          children: [
            s10,
            const ProfileStackImage(),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              leading: const Icon(Icons.person_2_outlined),
              title: Text(
                "Profile",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage())),
            ),
            ListTile(
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              leading: const Icon(Icons.settings_outlined),
              title: Text(
                "Settings",
                style: GoogleFonts.inter(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          s10,
          const Padding(
            padding: EdgeInsets.only(right: 40, left: 40),
            child: SearchBarNew(),
          ),
          // here the post section / you may call it post feed section wrap with a
          // listview builder =>
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return PostContainer(
                        username: "satya Prakash nayak",
                        userImage: "https://picsum.photos/200/300",
                        caption: "hii this is my first post on instagram");
                  },
                  separatorBuilder: (context, index) => s10,
                  shrinkWrap: true,
                  itemCount: 10)),
        ],
      ),
    );
  }
}
