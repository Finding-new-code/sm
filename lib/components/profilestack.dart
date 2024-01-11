import 'package:flutter/material.dart';

class ProfileStackImage extends StatelessWidget {
  // final String profileimage;
  // final String profileimage2;
  const ProfileStackImage({
    Key? key,
    /* required this.profileimage, required this.profileimage2*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(/* TODO: here the banner image*/ "")),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.5)),
            ),
          ),
          Positioned(
              top: 90,
              left: 40,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            /* TODO:Profile image here*/ "https://picsum.photos/200/300"),
                        fit: BoxFit.cover),
                    color: Colors.black26.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(7)),
              )),
        ],
      ),
    );
  }
}
