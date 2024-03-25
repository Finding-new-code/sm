///  here the comments bottom sheet is created
///  which we shows the list of commments and textfield to add new comment

import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/HomePage/bloc/home_bloc.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

commentbottomsheet(
 final String postid,
  BuildContext context,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      final TextEditingController commentController = TextEditingController();
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment',
                        hintStyle: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {
                    context.read<HomeBloc>().add(CommentPostedByUser(postid, commentController.text));
                  }, icon: const Icon(Icons.send))
                ],
              ),
              s25,
              ListView.separated(
                  itemBuilder: ((context, index) {
                    return const ListTile(
                        leading: CircleAvatar(
                        backgroundColor: Colors.black),
                        title: Text('username'),
                        subtitle: Text(
                          'comment',
                        ));
                  }),
                  separatorBuilder: (context, index) => s10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5)
            ],
          ),
        ),
      );
    },
  );
}
