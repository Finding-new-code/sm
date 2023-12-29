import 'package:flutter/material.dart';
import 'package:myapp/constants/tools.dart';

import '../../constants/constant.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<AuthPage> {
  bool isnew = true;
  // late AnimationController _controller;
  // late Animation<double> _animation;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children:[
          Column(
          children: [
            // Image.asset(
            //   'assets/logo.jpg',
            //   fit: BoxFit.contain,
            //   cacheHeight: 150,
            //   cacheWidth: 150,
            //   width: 150,
            //   height: 150,
            // ),
            s50,
            // textformfield #1
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: GoogleFonts.inter(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                magnifierConfiguration:
                    TextMagnifier.adaptiveMagnifierConfiguration,
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null) {
                    return "You can't make it empty";
                  }
                  return null;
                },
                controller: _email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Email Id",
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: "Enter the Email Id",
                    hintStyle: const TextStyle(color: Colors.white)),
                onChanged: (value) => _email,
              ),
            ),
            s10,
            // textformfield #2
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: GoogleFonts.inter(color: Colors.white),
                magnifierConfiguration:
                    TextMagnifier.adaptiveMagnifierConfiguration,
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null) {
                    return "You can't make it empty";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText:
                        (!isnew) ? "Enter the Password" : "Create a new password",
                    hintStyle: const TextStyle(color: Colors.white)),
                onChanged: (value) => _password,
              ),
            ),
            s10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (!isnew)
                      ? "Already have an Account, then what holds you"
                      : "Are you new, lets make a Account",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (isnew == true) {
                          isnew = false;
                        } else if (isnew == false) {
                          isnew = true;
                        }
                      });
                      debugPrint(isnew.toString());
                    },
                    child: const Text('Signin'))
              ],
            ),
            s10,
      
            ElevatedButton(
                onPressed: () {
                  // TODO:Auth
                  Navigator.pushNamed(context, "/");
                },
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.brown.shade300),
                )),
          ],
        ),]
      ),
    );
  }
}