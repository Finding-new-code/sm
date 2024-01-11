import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/ChatPage/chatpage.dart';
import 'package:myapp658d7b3746ed317621f8/components/failure.dart';
import '../../constants/constant.dart';
import '../../constants/tools.dart';
import '../../src/imagepicker.dart';
import 'bloc/post_bloc.dart';

class PostCreationPage extends StatefulWidget {
  const PostCreationPage({Key? key}) : super(key: key);

  @override
  State<PostCreationPage> createState() => _PostCreationPageState();
}

class _PostCreationPageState extends State<PostCreationPage> {
  final TextEditingController _postcontroller = TextEditingController();
  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    _postcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is PostFailure) {
          errorbottomsheet(context, state.message);
        }
        if (state is PostSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Create Post',
              style: GoogleFonts.inter(fontSize: 20),
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.deepPurpleAccent.shade400.withOpacity(0.4))),
                  onPressed: () {
                    _postcontroller.text.isEmpty
                        ? null
                        : context.read<PostBloc>().add(PostSendRequested(
                            text: _postcontroller.text, image: images));
                  },
                  child: Text(
                    'Post',
                    style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
                  )),
              s10,
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade400.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 348,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:
                              Colors.deepPurpleAccent.shade400.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        child: Column(
                          children: [
                            TextField(
                              controller: _postcontroller,
                              decoration: InputDecoration(
                                hintText: 'What\'s on your mind ?',
                                counterStyle:
                                    GoogleFonts.inter(color: Colors.white),
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 1),
                                border: InputBorder.none,
                              ),
                              maxLines: 7,
                              maxLength: 100,
                              style: GoogleFonts.inter(
                                  fontSize: 18, color: Colors.white),
                            ),
                            if (images.isNotEmpty)
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.teal.shade400.withOpacity(0.5),
                                  ),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 1,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, index) {
                                        return Image.file(
                                          images[index],
                                          fit: BoxFit.contain,
                                        );
                                      }))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                images = await imagepicker();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.image_outlined,
                                color: Colors.white.withOpacity(0.7),
                              )),
                          s10,
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white.withOpacity(0.7),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
