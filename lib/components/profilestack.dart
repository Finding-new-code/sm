import 'package:flutter/material.dart';

class ProfileStackImage extends StatelessWidget {
  final String profileimage;
  final String bannerimage;
  const ProfileStackImage(
      {super.key, required this.profileimage, required this.bannerimage});

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
                  image: DecorationImage(
                      image: NetworkImage(bannerimage), fit: BoxFit.cover),
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
                    image: DecorationImage(
                        image: NetworkImage(profileimage.isEmpty
                            ? "https://picsum.photos/200/300"
                            : profileimage),
                        fit: BoxFit.cover),
                    color: Colors.black26.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(7)),
              )),
        ],
      ),
    );
  }
}
