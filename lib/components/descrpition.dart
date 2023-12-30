import 'package:flutter/material.dart';
import 'package:myapp/constants/tools.dart';

import '../constants/constant.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            s10,
            Icon(
              Icons.pin_drop_rounded,
              color: Colors.grey.shade600,
            ),
            s10,
            Text(
              "location",
              style: GoogleFonts.inter(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        s25,
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 37, 37, 37),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                text: "Description :  ",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              children: [
                
                TextSpan(text: "someting i like to add",style: GoogleFonts.inter(fontWeight: FontWeight.w400))
              ])),
            ],
          ),
        )
      ],
    );
  }
}
