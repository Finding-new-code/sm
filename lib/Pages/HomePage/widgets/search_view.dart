import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import 'searchbar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(top: 10,left: 20,right: 10,
          child: SearchBarNew()),
          Column(
          children: [
            s100,
            Center(
              child: SvgPicture.asset("assets/rive/undraw_the_world_is_mine_re_j5cr.svg",
                  width: 150, height: 150),
            ),
            s25,
            const Text('hey why its not working'),
          ],
        ),
        ],
      ),
    );
  }
}
