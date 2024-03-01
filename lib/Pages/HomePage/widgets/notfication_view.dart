import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';


class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              "assets/rive/undraw_notify_re_65on.svg",
              width: 150,
              height: 150,
            )),
            s10,
            Text(
              'No notification yet',
              style:
                  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ]),
    );
  }
}
