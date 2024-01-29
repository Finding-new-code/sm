import 'dart:ui';

import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import '../../../components/failure.dart';
import '../../../components/termsandconditions.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../HomePage/VIew/homepage.dart';
import '../bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  // final Account account;
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthPage> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<AuthPage> {
  bool isnew = true;
  bool ischecked = false;
  // TODO: animation to be added but im thinking of other alternative
  late AnimationController _controller;
  late Animation<double> _animation;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();


  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          // ignore: void_checks
          return errorbottomsheet(context, state.message);
        }

        if (state is AuthSuccess) {
          debugPrint(state.toString());
          //here navigator for next page => HomePage
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>  HomePage(
                        isdark: false,
                      )),
              (route) => false);
        }

        /// here we can place more states =>
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        return Scaffold(
          body: Stack(
            children: [
              Container(color: Colors.teal,width: 50,height: 50,),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Column(
                children: [
                  s25,
                  // Image.asset(
                  //  here the image placed or logo
                  //   fit: BoxFit.contain,
                  //   width: 150,
                  //   height: 150,
                  // ),
                  s50,
                  isnew
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, left: 20, right: 20, bottom: 18),
                          child: TextFormField(
                            key: const ValueKey("Name_textfield"),
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
                            controller: _name,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.deepPurpleAccent),
                                ),
                                focusColor: Colors.deepPurpleAccent,
                                filled: true,
                                fillColor: Colors.deepPurpleAccent,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                labelText: "Name",
                                labelStyle: const TextStyle(
                                     color: Colors.white,
                                    fontWeight: FontWeight.w400),
                                hintText: "Enter your Name",
                                hintStyle: const TextStyle(
                                    // color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            onChanged: (value) => _name,
                          ),
                        )
                      : const SizedBox.shrink(),
                  // textformfield #1
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 20, right: 20, bottom: 7),
                    child: TextFormField(
                        key: const ValueKey("Email_textfield"),
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          labelText: "Email Id",
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                          hintText: "Enter the Email Id",
                          hintStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400)),
                      onChanged: (value) => _email,
                    ),
                  ),
                  s10,
                  // textformfield #2
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                        key: const ValueKey("Password_textfield"),
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).primaryColor,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                          hintText: (!isnew)
                              ? "Enter the Password"
                              : "Create a new password",
                          hintStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400)),
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
                            ? "Are you new, lets make a Account"
                            : "Already have an Account, then what holds you",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.hankenGrotesk(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          key: const ValueKey("switch_to_signin"),
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
                  TextButton(
                      onPressed: () {}, child: const Text("Forgot Password ?")),
                  s10,
                  isnew
                      ? Row(
                          children: [
                            s25,
                            Checkbox.adaptive(
                              value: ischecked,
                              onChanged: ((value) {
                                setState(() {
                                  ischecked = value!;
                                });
                              }),
                            ),
                            s10,
                            Text(
                              "I agree to the",
                              style: GoogleFonts.inter(
                                   fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TermsAndConditions()));
                              },
                              child: Text(
                                "terms and conditions",
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        )
                      : const SizedBox.shrink(),
                        
                  ElevatedButton(
                     key: const ValueKey("Proceed"),
                      onPressed: () {
                        if (ischecked == true) {
                          context.read<AuthBloc>().add(AsAuthRequest(
                              isnew: isnew,
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                              name: _name.text.trim().toString()));
                        }
                        if (isnew == false) {
                          context.read<AuthBloc>().add(AsAuthRequest(
                              isnew: isnew,
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                              name: _name.text.trim().toString()));
                        }


                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomePage(
                        //               isdark: false,
                        //             )),
                        //     (route) => false);
                      },
                      child: Text(
                        'Proceed',
                        style: TextStyle(color: Colors.brown.shade500),
                      )),
                ],
                          ),
              ),
            ],
          ),
        );
      },
    );
  }
}
