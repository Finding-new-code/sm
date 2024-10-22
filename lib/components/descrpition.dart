import 'package:flutter/material.dart';


import '../constants/constant.dart';
import '../constants/tools.dart';

class DescriptionTile extends StatelessWidget {
  final String descrpition;
  final String location;
  const DescriptionTile({super.key, required this.descrpition, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade900,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                text: "Description: ",
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: descrpition,style: GoogleFonts.inter(fontWeight: FontWeight.w400))
              ])),
            ],
          ),
        ),
        s25,
        Row(
          children: [
            s10,
            Icon(
              Icons.pin_drop_sharp,
              size: 18,
              color: Theme.of(context).hintColor,
            ),
            s10,
            Text(
              location,
              style: GoogleFonts.inter(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
