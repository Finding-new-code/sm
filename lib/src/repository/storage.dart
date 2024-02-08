import 'dart:io';

import 'package:appwrite/appwrite.dart';

import '../../constants/appwriteconstants.dart';


class StorageRepository {
  final Storage storage;
  StorageRepository({
    required this.storage,
  });

  /// Uploads a file to the bucket then return the lists of file's UID.
  Future<List<String>> uploadFile(List<File> files) async {
     List<String> imagelinks =  [];
    for (final file in files) {
    final result = await storage.createFile(
        bucketId: AppwriteConstants.storageBucket,
        file: InputFile.fromPath(path: file.path),
        fileId: ID.unique(),
        );
    imagelinks.add(AppwriteConstants.imageslinks(result.$id));
    }
    return imagelinks;
  }



}
