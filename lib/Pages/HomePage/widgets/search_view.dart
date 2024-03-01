import 'package:flutter/material.dart';
import '../../../constants/tools.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset('assets/rive/undraw_heart.svg',width: 150,height: 150),
          )
        ],
      ),
    );
  }
}