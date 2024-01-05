import 'package:flutter/material.dart';
import '../../components/capsulebuttonbar.dart';
import '../../components/postsection.dart';
import '../../components/profilestack.dart';
import '../../components/searchbar.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';

/// This is the homepage of the application 
class HomePage extends StatelessWidget {
 final bool isdark;
   const HomePage({super.key, required this.isdark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 20),
        child: CapsuleStyleButtonBar(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Explore",
          style: GoogleFonts.inter(
              fontSize: 19,
              fontWeight: FontWeight.bold),
        ),
      ),
      /// here the side drawer codes =>
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        child: Column(
          children: [s10, const ProfileStackImage(),ThemeButton(isdark: isdark)],
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
            child: ListView.separated(itemBuilder: (context, index) {
              return  PostContainer(
                username: "satya Prakash nayak",
                userImage: "https://picsum.photos/200/300",
                caption: "hii this is my first post on instagram");
            }, separatorBuilder: (context,index) => s10, shrinkWrap: true, itemCount: 10)
          ),
        ],
      ),
    );
  }
}


@immutable
class ThemeButton extends StatefulWidget {
 bool isdark;
 ThemeButton({super.key, required this.isdark});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        widget.isdark = !widget.isdark;
      });
    }, icon: const Icon(Icons.sunny,color: Colors.white),
    selectedIcon: const Icon(Icons.dark_mode,color: Colors.white),
    isSelected: widget.isdark,);
  }
}