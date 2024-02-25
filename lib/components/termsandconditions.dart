import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../constants/terms.dart';
import '../constants/tools.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: const Text('Terms and Conditions'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: media.width * 0.05,right: media.width * 0.05,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "These Terms and Conditions ('Terms') govern your access to and use of the $productName social media application ('App'), developed and operated by Coderlabs ('Company'). By accessing or using the App, you agree to be bound by these Terms.",
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[0].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[0].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[1].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[1].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[2].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[2].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[3].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[3].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[4].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[4].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[5].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[5].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[6].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[6].content,
                  style: GoogleFonts.inter(),
                ),
                s10,
                Text(
                  terms[7].heading,
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                s10,
                Text(
                  terms[7].content,
                  style: GoogleFonts.inter(),
                ),
                s25,
              ],
            ),
          ),
        ));
  }
}
