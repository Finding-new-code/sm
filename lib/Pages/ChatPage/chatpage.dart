import 'package:flutter/material.dart';
import '../../components/chatbubble.dart';
import '../../components/chattile.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';
import '../../src/modals/messagemap.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Chats",
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          ListView.separated(
              itemBuilder: (context, index) {
                return ChatTile(
                  name: "satya Prakash Nayak",
                  lastmessage: "Mayday Mayday Mayday",
                  time: "12:00",
                  image: "https://picsum.photos/200/300",
                );
              },
              separatorBuilder: (context, index) => const SizedBox.shrink(),
              shrinkWrap: true,
              itemCount: 5)
        ],
      ),
    );
  }
}

// chat screen to show message from a paricular user =>
List<MessageMap> messages = [];

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatView> {
  void _addMessage(String message, bool isReceiver) {
    /// function created for adding message to the list(array) messages
    messages.add(MessageMap(
      isrecevier: isReceiver,
      message: message,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final prompt = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              s50,
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
              s10,
              Text(
                'Satya Prakash Nayak',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        forceMaterialTransparency: true,
        actions: [
          /// icon button for delete the message list =>
          IconButton(
              onPressed: () {
                messages.clear();
                setState(() {});
              },
              icon: Icon(
                Icons.more_vert_outlined,
                color: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .color
                    ?.withOpacity(0.5),
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// listview for showing lists of messages
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                MessageMap message = messages[index];
                return Message(
                  isReceiver: message.isrecevier,
                  text: message.message,
                );
              }, //// message widget
              itemCount: messages.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
            )),

            /// text bar for writing prompt or messages to chat
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.inter(),
                      controller: prompt,
                      cursorColor: ColorEffect.neutralValue,
                      decoration: InputDecoration(
                        // isCollapsed: true,
                        hintText: "Enter a message",
                        hintStyle:
                            GoogleFonts.inter(fontWeight: FontWeight.w600),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton.filledTonal(

                      /// openai api called if textfield have a text otherwise return null
                      onPressed: () async {
                        if (prompt.text.isEmpty) {
                          return;
                        } else {
                          _addMessage(
                            prompt.text,
                            false,
                          );
                          // here the chat codes will be placed =>
                        }
                      },
                      enableFeedback: true,

                      /// send icon
                      icon: Icon(
                        Icons.send_rounded,
                        color: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .color
                            ?.withOpacity(0.64),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
