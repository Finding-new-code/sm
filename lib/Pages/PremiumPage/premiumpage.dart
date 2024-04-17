import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
      
        Scaffold(
          body: SizedBox(
            width: 500,
            height: 800,
            child: Image.asset('assets/images/hellofoxy.jpeg',fit: BoxFit.cover,),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Animate(
                  effects: const [FadeEffect(), ThenEffect()],
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 50,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        Text(
                          "Premium",
                          style: GoogleFonts.inter(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 30),
                        ),
                        s25,
                        Text(
                          "some door are kept to be remain closed \nbut you can unlock them with premium",
                          style: GoogleFonts.hankenGrotesk(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.6)),
                        )
                      ]),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
