import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:myapp658d7b3746ed317621f8/components/dialog.dart';
import '../../components/chattile.dart';
import '../../components/failure.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';
import '../../src/imagepicker.dart';
import '../../src/modals/messagemap.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

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

// class SuzumeChat extends StatefulWidget {
//   const SuzumeChat({required this.api, super.key, required String name, required String image});

//   final String api;

//   @override
//   State<SuzumeChat> createState() => _SuzumeChatState();
// }

// class _SuzumeChatState extends State<SuzumeChat> {
//   late final GenerativeModel _model;
//   late final ChatSession _chat;
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _textController = TextEditingController();
//   final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
//   bool isloading = false;

//   @override
//   void initState() {
//     super.initState();
//     _model = GenerativeModel(
//       model: 'gemini-pro',
//       apiKey: widget.api,
//     );
//     _chat = _model.startChat();
//   }

//   void _scrollDown() {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(
//           milliseconds: 750,
//         ),
//         curve: Curves.easeOutCirc,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final history = _chat.history.toList();
//     return Scaffold(

//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemBuilder: (context, idx) {
//                   final content = history[idx];
//                   final text = content.parts
//                       .whereType<TextPart>()
//                       .map<String>((e) => e.text)
//                       .join('');
//                   return MessageWidget(
//                     text: text,
//                     isFromUser: content.role == 'user',
//                   );
//                 },
//                 itemCount: history.length,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 25,
//                 horizontal: 15,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       autofocus: true,
//                       focusNode: _textFieldFocus,
//                       decoration:
//                           textFieldDecoration(context, 'Enter a prompt...'),
//                       controller: _textController,
//                       onSubmitted: (String value) {
//                         _sendChatMessage(value);
//                       },
//                     ),
//                   ),
//                   const SizedBox.square(dimension: 15),
//                   if (!isloading)
//                     IconButton(
//                       onPressed: () async {
//                         _sendChatMessage(_textController.text);
//                       },
//                       icon: Icon(
//                         Icons.send,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     )
//                   else
//                     const CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _sendChatMessage(String message) async {
//     setState(() {
//       isloading = true;
//     });

//     try {
//       final response = await _chat.sendMessage(
//         Content.text(message),
//       );
//       final text = response.text;

//       if (text == null) {
//         errorbottomsheet(context,'Empty response.');
//         return;
//       } else {
//         setState(() {
//           isloading = false;
//           _scrollDown();
//         });
//       }
//     } catch (e) {
//       errorbottomsheet(context,e.toString());
//       setState(() {
//         isloading = false;
//       });
//     } finally {
//       _textController.clear();
//       setState(() {
//         isloading = false;
//       });
//       _textFieldFocus.requestFocus();
//     }
//   }

//   void errorbottomsheet(context,String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Something went wrong'),
//           content: SingleChildScrollView(
//             child: Text(message),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
// }

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
    required this.recevierImg,
  });

  final String text;
  final bool isFromUser;
  final String recevierImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isFromUser ? 20 : 0, right: isFromUser ? 0 : 20),
      child: Row(
        mainAxisAlignment:
            isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          s10,
          Offstage(
            offstage: isFromUser,
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://picsum.photos/200/300',
              ),
            ),
          ),
          s10,
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              decoration: BoxDecoration(
                color: isFromUser
                    ? Colors.deepPurple.shade900.withOpacity(0.7)
                    : const Color.fromARGB(255, 29, 28, 28),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              margin: const EdgeInsets.only(bottom: 20),
              child: MarkdownBody(data: text),
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration textFieldDecoration(BuildContext context, String hintText) =>
    InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

class SuzumeChat extends StatefulWidget {
  final String name;
  final String image;
  final String api;
  const SuzumeChat(
      {super.key, required this.name, required this.image, required this.api});

  @override
  State<SuzumeChat> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<SuzumeChat> {
  late GenerativeModel _model;
  final List<({Image? image, String? text, bool fromUser})> _generatedContent =
      <({Image? image, String? text, bool fromUser})>[];
  late GenerativeModel _visionModel;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  bool isloading = false;
  late final ChatSession _chat;
  // List<MessageMap> messages = [];
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: widget.api,
    );
    _visionModel = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: widget.api,
    );
    _chat = _model.startChat();
  }

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

  void _addMessage(String message, bool isReceiver) async {
    setState(() {
      isloading = true;
    });

    try {
      final response = await _chat.sendMessage(
        Content.text(message),
      );
      final text = response.text;

      if (text == null) {
        errorbottomsheet(context, 'Empty response.');

        return;
      } else {
        setState(() {
          isloading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      errorbottomsheet(context, e.toString());
      setState(() {
        isloading = false;
      });
    } finally {
      _messageController.clear();
      setState(() {
        isloading = false;
      });
      // _textFieldFocus.requestFocus();
    }
  }

  Future<void> sendImagePrompt(String message) async {
    setState(() {
      isloading = true;
    });
    try {
      ByteData catBytes = await rootBundle.load('assets/images/hellofoxy.jpg');
      ByteData sconeBytes = await rootBundle.load('assets/images/verify.jpg');
      final content = [
        Content.multi([
          TextPart(message),
          // The only accepted mime types are image/*.
          DataPart('image/jpeg', catBytes.buffer.asUint8List()),
          DataPart('image/jpeg', sconeBytes.buffer.asUint8List()),
        ])
      ];
      _generatedContent.add((
        image: Image.asset("assets/images/cat.jpg"),
        text: message,
        fromUser: true
      ));
      _generatedContent.add((
        image: Image.asset("assets/images/scones.jpg"),
        text: null,
        fromUser: true
      ));

      var response = await _visionModel.generateContent(content);
      var text = response.text;

      _generatedContent.add((image: null, text: text, fromUser: false));

      if (text == null) {
        showErrorDialog('No response from API.', context);
        return;
      } else {
        setState(() {
          isloading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      showErrorDialog(e.toString(), context);
      setState(() {
        isloading = false;
      });
    } finally {
      _messageController.clear();
      setState(() {
        isloading = false;
      });
      //_textFieldFocus.requestFocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final history = _chat.history.toList();
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
                backgroundImage: NetworkImage(
                  widget.image.toString(),
                ),
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
                // messages.clear();
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
                final content = history[index];
                final text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return MessageWidget(
                  recevierImg: widget.image,
                    text: text, isFromUser: content.role == 'user');
              }, //// message widget
              itemCount: history.length,
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
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                      )),
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
                  isloading
                      ? const CircularProgressIndicator.adaptive()
                      : IconButton.filledTonal(
                          highlightColor: Colors.deepPurpleAccent,
                          hoverColor: Colors.teal,

                          /// openai api called if textfield have a text otherwise return null
                          onPressed: () async {
                            if (_messageController.text.isEmpty) {
                              return;
                            } else {
                              setState(() {
                                isloading = true;
                              });
                              _addMessage(
                                _messageController.text,
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

class ChatView extends StatefulWidget {
  final String name;
  final String image;
  const ChatView({super.key, required this.name, required this.image});

  @override
  State<ChatView> createState() => _ChatState();
}

class _ChatState extends State<ChatView> {
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
                backgroundImage: NetworkImage(
                  widget.image.toString(),
                ),
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
                return MessageWidget(
                  recevierImg: widget.image,
                  isFromUser: message.isrecevier,
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
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => imagepicker(),
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                      )),
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
                  isloading
                      ? const CircularProgressIndicator.adaptive()
                      : IconButton.filledTonal(
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
                                isloading = true;
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
