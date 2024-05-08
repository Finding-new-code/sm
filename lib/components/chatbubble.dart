import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

//// message widgets
class Message extends StatelessWidget {
  final bool isReceiver;
  final String text;
  final String receiverimg;

  const Message({
    super.key,
    required this.isReceiver,
    required this.text,
    required this.receiverimg,
  });

  @override
  Widget build(BuildContext context) {
    /// animation of message popup
    return Animate(
      effects: const [FadeEffect()],
      child: Flexible(
        child: Row(
          mainAxisAlignment:
              isReceiver ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment:
              isReceiver ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (isReceiver == true)
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(receiverimg),
              ),

            /// message container as shown
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.6,
              ),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isReceiver
                    ? Colors.black45.withOpacity(0.5)
                    : Colors.deepPurple.shade900.withOpacity(0.7),
              ),
              child:
                  /// message content can be pass through this text widget
                  Markdown(data: text),
            ),
          ],
        ),
      ),
    );
  }
}
