import 'package:myapp658d7b3746ed317621f8/constants/constant.dart';
import 'package:share_plus/share_plus.dart';

void share(String text) {
  Share.share("hey!! check out this cool post on $productName : $text");
}