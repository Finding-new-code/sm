import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

class SearchBarNew extends StatelessWidget {
  const SearchBarNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: true,
          child: Animate(
            effects: const [SlideEffect()],
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 48, 48, 68),
                ),
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: const [
                      ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.black),
                          title: Text('username'),
                          subtitle: Text(
                            'comment',
                          ))
                    ])),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          height: 45,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 20, 20, 32),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
