import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktoptype;
  final Widget tablettype;
  final Widget mobiletype;
  const ResponsiveLayout(
      {Key? key,
      required this.desktoptype,
      required this.tablettype,
      required this.mobiletype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return desktoptype;
        } else if (constraints.maxWidth > 800) {
          return tablettype;
        } else {
          return mobiletype;
        }
      },
    );
  }
}
