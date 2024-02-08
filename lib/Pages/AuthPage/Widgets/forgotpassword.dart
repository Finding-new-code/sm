
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/constants/tools.dart';
class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Recovery Password',style: GoogleFonts.inter(fontSize: 20),),
        ],
      ),
    );
  }
}