import 'dart:io';

import '../constants/tools.dart';

Future<List<File>> imagepicker() async {
  List<File> images = [];
  final ImagePicker imagePicker = ImagePicker();
  final List<XFile> imagepicker = await imagePicker.pickMultiImage();
  if (imagepicker.isNotEmpty) {
    for (final image in imagepicker) {
      images.add(File(image.path));
    }
  }

  return images;
}

Future<List<File>> pickmuiltiplemedia() async {
  List<File> medias = [];
  final ImagePicker imagePicker = ImagePicker();

  /// if medias is empty or less than 4
  if (medias.isEmpty || medias.length < 4) {
    final List<XFile> mediapicker = await imagePicker.pickMultipleMedia();
    if (mediapicker.isNotEmpty && medias.length < 4) {
      if (mediapicker.isNotEmpty) {
        for (final media in mediapicker) {
          medias.add(File(media.path));
        }
      }
    }
  }


  return medias;
}
