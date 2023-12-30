import 'package:flutter/material.dart';

import '../../components/chattile.dart';
import '../../constants/tools.dart';


class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Chats",style: GoogleFonts.inter(fontSize: 20),),
      ),
      body: Column(
        children: [
          ListView.separated(itemBuilder: (context, index) {
           return const ChatTile();
          }, separatorBuilder: (context, index) => const SizedBox(width: 10,height: 10,), itemCount: 5)
        ],
      ),
    );
  }
}