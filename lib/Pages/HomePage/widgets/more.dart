import 'package:flutter/material.dart';
import '../../../constants/tools.dart';

moreoptionBottomSheet(BuildContext ctx, String postid, VoidCallback ondelete,
    VoidCallback onreport) {
  return showModalBottomSheet(
      useSafeArea: true,
      context: ctx,
      enableDrag: true,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: ondelete,
              leading: const Icon(
                Icons.delete_sharp,
                color: Colors.red,
              ),
              title: Text(
                'delete Post',
                style: GoogleFonts.inter(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.report_problem_sharp),
              title: Text('report Post'),
            ),
            ListTile(
              leading: const Icon(Icons.feedback_sharp),
              title: const Text('feedback'),
              onTap: () {
                BetterFeedback.of(ctx).show((p0) => null);
              },
            ),
          ],
        );
      });
}
