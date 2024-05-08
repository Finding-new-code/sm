
import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../constants/tools.dart';

errorbottomsheet(BuildContext context, String error) {
  return showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          
          ),
        width: 500,
        child: Expanded(
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
                      image: AssetImage("assets/images/hellofoxy.jpeg"), fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade500,
                ),
              ),
              s10,
              Text(
                "Error",
                style: GoogleFonts.inter(
                   fontSize: 25, fontWeight: FontWeight.bold),
              ),
              s10,
              Text(
                error,
                style: GoogleFonts.inter(
                     fontSize: 17, fontWeight: FontWeight.w300),
              ),
              s50,
            ],
          ),
        ),
      );
    },
  );
}