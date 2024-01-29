
import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

errorbottomsheet(BuildContext context, String error) {
  return showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          
          ),
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            s25,
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  isAntiAlias: true,
                    image: AssetImage("assets/images/image.png"), fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade500,
              ),
            ),
            s10,
            Text(
              "Error",
              style: GoogleFonts.inter(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            s10,
            SingleChildScrollView(
              child: Text(
                error,
                style: GoogleFonts.inter(
                    color: Colors.white, fontSize: 17, fontWeight: FontWeight.w300),
              ),
            ),
            s25
          ],
        ),
      );
    },
  );
}