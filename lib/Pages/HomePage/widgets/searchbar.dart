import 'package:flutter/material.dart';
import '../../../constants/constant.dart';

class SearchBarNew extends StatelessWidget {
  const SearchBarNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 22, 21, 21),),
      child: const Row(
        children: [
          s10,
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Icon(Icons.search, color: Colors.white,)
        ],
      ),
    );
  }
}