import 'package:flutter/material.dart';
import '../../../constants/constant.dart';
import '../../../constants/tools.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key, });

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {


  // @override
  // void initState() {
  //   super.initState();
  //   subscribe();
  // }

  // Stream subscribe() {
  //   try {
  //     final realtime = widget.realtime;
  //     _subscription = realtime.subscribe([
  //       "databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.postCollection}.documents"
  //     ]);
  //     // _subscription!.stream.listen((resonse) {
  //     //   if (resonse.events.isEmpty) {
  //     //     debugPrint(
  //     //         'listening for a change ${resonse.timestamp},${resonse.channels}');
  //     //   }

  //     //   if (resonse.events.isNotEmpty) {
  //     //     if (resonse.events
  //     //         .contains('databases.*.collections.*.documents.*.create')) {
  //     //       debugPrint(Post.fromMap(resonse.payload).toString());
  //     //       setState(() {});
  //     //     }
  //     //   }
  //     // });
  //   } on AppwriteException catch (e) {
  //     if (kDebugMode) {
  //       print(e.message);
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("fuck: $e");
  //     }
  //   }
  //   debugPrint(_subscription!.stream.toString());
  //   return _subscription!.stream;
  // }

  // @override
  // void dispose() {
  //   _subscription!.close;
  //   super.dispose();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Center(
              child: SvgPicture.asset(
            "assets/rive/undraw_notify_re_65on.svg",
            width: 150,
            height: 150,
          )),
          s10,
          Text(
            'No notification yet',
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ]));
  }
}
