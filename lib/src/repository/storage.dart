
import 'dart:io';

import 'package:appwrite/appwrite.dart';

import '../../constants/appwriteconstants.dart';

/// A repository for interacting with the Appwrite storage bucket.
class StorageRepository {
  final Storage _storage;
  StorageRepository({
    required Storage storage,
  }) : _storage = storage;

  /// Uploads a file to the bucket then return the lists of file's UID.
  Future<List<String>> uploadFile(List<File> files) async {
    List<String> imagelinks = [];
    for (final file in files) {
      final uploadedimage = await _storage.createFile(
        bucketId: AppwriteConstants.storageBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      imagelinks.add(AppwriteConstants.imageslinks(uploadedimage.$id));
    }
    return imagelinks;
  }
  // here this code is implementation of Deleting a file from the [$storageBucket]
  Future<void> deleteFile(String fileId) async {
    return await _storage.deleteFile(
      bucketId: AppwriteConstants.storageBucket,
      fileId: fileId,
    );
  }
}
