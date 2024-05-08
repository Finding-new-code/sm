import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../components/failure.dart';
import '../../../components/termsandconditions.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';
import '../../HomePage/VIew/homepage.dart';
import '../bloc/auth_bloc.dart';

class AuthdesktopView extends StatefulWidget {
  // final Account account;
  const AuthdesktopView({
    super.key,
  });

  @override
  State<AuthdesktopView> createState() => _AuthDesktopView();
}

class _AuthDesktopView extends State<AuthdesktopView>
    with TickerProviderStateMixin {
  bool isnew = true;
  bool ischecked = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  // late Animation<double> _animation1;
  // late Animation<double> _animation2;

  bool _showpassword = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void initState() {
    super.initState();
    _showpassword = true;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
            begin: Random(1).nextInt(100).toDouble(),
            end: Random(2).nextInt(3000).toDouble())
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    // _animation1 = Tween<double>(
    //       begin: Random(1).nextInt(100).toDouble(),
    //       end: Random(2).nextInt(2000).toDouble())
    //   .animate(_controller)
    // ..addListener(() {
    //   setState(() {});
    // });
    // _animation2 = Tween<double>(
    //       begin: Random(1).nextInt(100).toDouble(),
    //       end: Random(2).nextInt(1000).toDouble())
    //   .animate(_controller)
    // ..addListener(() {
    //   setState(() {});
    // });
    _controller.loop();
  }

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
          errorbottomsheet(context, state.message);
        }

        if (state is AuthSuccess) {
          debugPrint(state.toString());
          //here navigator for next page => HomePage
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
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
              Transform.translate(
                offset: Offset(_animation.value, _animation.value),
                child: Container(
                  color: Colors.teal,
                  width: 100,
                  height: 100,
                ),
              ),
              Positioned(
                  top: 500,
                  left: 350,
                  child: Container(
                    color: Colors.deepPurpleAccent,
                    width: 100,
                    height: 100,
                  )),
              Positioned(
                  top: 350,
                  left: 150,
                  child: Container(
                    color: Colors.blueAccent,
                    width: 100,
                    height: 100,
                  )),
              Positioned(
                  top: 350,
                  left: 900,
                  child: Container(
                    color: Colors.deepPurpleAccent,
                    width: 100,
                    height: 100,
                  )),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
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
                                top: 0.0, left: 500, right: 500, bottom: 18),
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
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurpleAccent),
                                  ),
                                  focusColor: Colors.deepPurpleAccent,
                                  filled: true,
                                  fillColor: Colors.deepPurpleAccent.shade200,
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  labelText: "Name",
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  hintText: "Enter your Name",
                                  hintStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                              onChanged: (value) => _name,
                            ),
                          )
                        : const SizedBox.shrink(),
                    // textformfield #1
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, left: 500, right: 500, bottom: 7),
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
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Email Id",
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter the Email Id",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                        onChanged: (value) => _email,
                      ),
                    ),
                    s10,
                    // textformfield #2
                    Padding(
                      padding: const EdgeInsets.only(left: 500, right: 500),
                      child: TextField(
                        key: const ValueKey("Password_textfield"),
                        style: GoogleFonts.inter(color: Colors.white),
                        magnifierConfiguration:
                            TextMagnifier.adaptiveMagnifierConfiguration,
                        obscureText: _showpassword,
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                key: const ValueKey("visibility_icon"),
                                onPressed: () => setState(() {
                                      _showpassword = !_showpassword;
                                      debugPrint(_showpassword.toString());
                                    }),
                                icon: _showpassword
                                    ? const Icon(Icons.visibility_sharp,
                                        color: Colors.white)
                                    : const Icon(Icons.visibility_off_sharp,
                                        color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).primaryColor,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Password",
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            hintText: (!isnew)
                                ? "Enter the Password"
                                : "Create a new password",
                            helperText:
                                "Password must contain special character",
                            helperStyle:
                                const TextStyle(color: Colors.deepPurpleAccent),
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
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
                        onPressed: () {},
                        child: const Text("Forgot Password ?")),
                    s10,
                    isnew
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                style: GoogleFonts.inter(fontSize: 15),
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
                    s10,

                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          minimumSize: WidgetStateProperty.all(
                            const Size(100, 60),
                          ),
                        ),
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
                          style: TextStyle(
                              color: Colors.brown.shade500,
                              fontWeight: FontWeight.w400),
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
