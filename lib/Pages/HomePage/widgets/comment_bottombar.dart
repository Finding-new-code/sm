///  here the comments bottom sheet is created
///  which we shows the list of commments and textfield to add new comment

import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/constants/tools.dart';
import '../../../constants/constant.dart';

commentbottomsheet(
  BuildContext context,
) {
  return showModalBottomSheet(
    // isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Add a comment',
                  hintStyle: GoogleFonts.inter(
                    color: Colors.black,
                    //fontWeight: f
                  ),
                ),
              ),
              s25,
              ListView.separated(
                  itemBuilder: ((context, index) {
                    return const ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.black),
                      title: Text('username'),
                      subtitle: Text('comment',)
                    );
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
