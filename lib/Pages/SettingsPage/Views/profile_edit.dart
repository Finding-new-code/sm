import 'package:flutter/material.dart';

import '../../../constants/tools.dart';

class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Account'),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                hintText: 'name',
                counterStyle: GoogleFonts.inter(color: Colors.transparent),
                hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              maxLines: 2,
              maxLength: 40,
              style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
            ),


             TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: 'email',
                counterStyle: GoogleFonts.inter(color: Colors.transparent),
                hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              maxLines: 2,
              maxLength: 50,
              style: GoogleFonts.inter(fontSize: 18, color: Colors.transparent),
            ),


             TextFormField(
              controller: _biocontroller,
              decoration: InputDecoration(
                hintText: 'bio',
                counterStyle: GoogleFonts.inter(color: Colors.white),
                hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              maxLines: 4,
              maxLength: 70,
              style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
            ),


             TextFormField(
              controller: _phonecontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone',
                counterStyle: GoogleFonts.inter(color: Colors.transparent),
                hintStyle: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              maxLines: 1,
              maxLength: 10,
              style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
            ),

          ],
        ));
  }
}
