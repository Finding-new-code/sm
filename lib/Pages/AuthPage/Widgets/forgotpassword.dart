import 'package:flutter/material.dart';

import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

class RecoveryPassword extends StatelessWidget {
  RecoveryPassword({super.key});
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Recovery Password',
            style: GoogleFonts.inter(fontSize: 20),
          ),
          s25,
          Padding(
            padding:
                const EdgeInsets.only(top: 0.0, left: 20, right: 20, bottom: 7),
            child: TextField(
              key: const ValueKey("forgot_password_textfield"),
              style: GoogleFonts.inter(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              magnifierConfiguration:
                  TextMagnifier.adaptiveMagnifierConfiguration,
              controller: _password,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  // labelText: "Em",
                  // labelStyle: const TextStyle(
                  //     color: Colors.white, fontWeight: FontWeight.w400),
                  hintText: "Enter your new password",
                  helperText:
                      'your password must have 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character',
                  helperStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)),
              onChanged: (value) => _password,
            ),
          ),

          /// re-confirm your password => _confirmPassword
          TextField(
            key: const ValueKey(" Reconfirm_Password_textfield"),
            style: GoogleFonts.inter(color: Colors.white),
            magnifierConfiguration:
                TextMagnifier.adaptiveMagnifierConfiguration,
            obscureText: true,
            controller: _confirmPassword,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                filled: true,
                fillColor: Theme.of(context).primaryColor,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: "Password",
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400),
                hintText: "Enter the Password",
                hintStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            onChanged: (value) => _confirmPassword,
          ),
          s25,
          ElevatedButton(onPressed: () {}, child: const Text('Proceed'))
        ],
      ),
    );
  }
}


