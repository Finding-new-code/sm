import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/src.dart';
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
              itemCount: 2),
          ChatTile(
              name: 'Suzume.Ai',
              image:
                  'https://a.storyblok.com/f/178900/1504x630/5f85769d56/8743761060b8b5b23ef45ece8c7677361681577115_main.jpg/m/filters:quality(95)format(webp)')
        ],
      ),
    );
  }
}

// chat screen to show message from a paricular user =>


class ChatView extends StatefulWidget {
  final String name;
  final String image;
  const ChatView({super.key, required this.name, required this.image});

  @override
  State<ChatView> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  bool isloading = false;
  List<MessageMap> messages = [];
  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void _addMessage(String message, bool isReceiver) {
    /// function created for adding message to the list(array) messages
    messages.add(MessageMap(
      isrecevier: isReceiver,
      message: message,
    ));
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              s50,
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.image.toString(),),
              ),
              s10,
              Text(
                widget.name.toString(),
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              s10,
              Image.asset(
                'assets/images/verify.png',
                height: 25,
                width: 25,
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
              controller: _scrollController,
              itemBuilder: (context, index) {
                MessageMap message = messages[index];
                return Message(
                  isReceiver: message.isrecevier,
                  text: message.message,
                  receiverimg: widget.image,
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
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => imagepicker(),
                      icon: const Icon(Icons.add_a_photo_outlined,)),
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.inter(),
                      controller: _messageController,
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
                  isloading ? const CircularProgressIndicator.adaptive() : IconButton.filledTonal(
                      highlightColor: Colors.deepPurpleAccent,
                      hoverColor: Colors.teal,

                      /// openai api called if textfield have a text otherwise return null
                      onPressed: () async {
                        if (_messageController.text.isEmpty) {
                          return;
                        } else {
                          _addMessage(
                            _messageController.text,
                            false,
                          );
                          _messageController.clear();
                          setState(() {
                            _scrollDown();
                            isloading=true;
                          });
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
