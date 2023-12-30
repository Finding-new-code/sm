import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

class SearchBarNew extends StatelessWidget {
  const SearchBarNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 22, 21, 21),),
      child: Row(
        children: [
          s10,
          // TODO : here the searchbar implementation takes place
          Text("Search",style: GoogleFonts.inter(color: Colors.white,fontSize: 13),)
        ],
      ),
    );
  }
}