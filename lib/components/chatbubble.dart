// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

//// message widgets
class Message extends StatelessWidget {
  final bool isReceiver;
  final String text;

  const Message({
    super.key,
    required this.isReceiver,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    /// animation of message popup
    return Animate(
      effects: const [FadeEffect()],
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
        child: Row(
          mainAxisAlignment:
              isReceiver ? MainAxisAlignment.start : MainAxisAlignment.end,
              crossAxisAlignment: isReceiver ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (isReceiver == true)
              const CircleAvatar(
                child: Icon(Icons.person_3_rounded),
              ),

            /// message container as shown
            Container(
              width: MediaQuery.of(context).textScaleFactor + 200,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isReceiver ? Colors.black45.withOpacity(0.5) : Colors.deepPurple.shade900.withOpacity(0.7),
              ),
              child:

                  /// message content can be pass through this text widget
                  Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}