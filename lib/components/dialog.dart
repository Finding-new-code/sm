import 'package:flutter/material.dart';
import '../constants/tools.dart';

showErrorDialog(
  String errortext,
  BuildContext context) {
    return AlertDialog(
      title: Text('Error',style: GoogleFonts.inter(fontSize: 28,fontWeight: FontWeight.w700),),
      content: Text(errortext,style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400),),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK',style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400),),
        ),
      ],
    );
  }

  showAlertDialog(
  String errortext,
  BuildContext context) {
    return AlertDialog(
      title: Text('Error',style: GoogleFonts.inter(fontSize: 28,fontWeight: FontWeight.w700),),
      content: Text(errortext,style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400),),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK',style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400),),
        ),
      ],
    );
  }