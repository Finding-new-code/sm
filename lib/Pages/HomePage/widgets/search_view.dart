import 'package:flutter/material.dart';
import '../../../constants/tools.dart';
import 'searchbar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SearchBarNew(),
          Center(
            child: SvgPicture.asset("assets/rive/undraw_notify_re_65on.svg",
                width: 100, height: 100),
          ),
          const Text('hey why its not working'),
        ],
      ),
    );
  }
}
