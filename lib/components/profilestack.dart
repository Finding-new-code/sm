import 'package:flutter/material.dart';

class ProfileStackImage extends StatelessWidget {
  const ProfileStackImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
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
                  borderRadius: BorderRadius.circular(15), color: Colors.teal),
            ),
          ),
          Positioned(
              top: 90,
              left: 40,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(7)),
              ))
        ],
      ),
    );
  }
}
