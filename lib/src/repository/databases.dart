import 'package:appwrite/models.dart';
import '../modals/usermodel.dart';
import '../../constants/appwriteconstants.dart';
import '../../constants/tools.dart';
import '../modals/post.dart';

class DatabasesRepository {
  final Databases _databases;
  final Realtime _realtime;
  DatabasesRepository(
      {required Databases databases, required Realtime realtime})
      : _databases = databases,
        _realtime = realtime;

  Future<void> sendUserData(UserModel user, String id) async {
    await _databases.createDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.userdatabase,
        documentId: id,
        data: user.toMap());
  }

  Future<List<Document>> searchUsersByName(String user) async {
    final document = await _databases.listDocuments(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.userdatabase,
        queries: [Query.search('name', user)]);
    return document.documents.toList();
  }

  Future<void> postSendToServer(Post post) async {
    await _databases.createDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.postCollection,
        documentId: ID.unique(),
        data: post.toMap());
  }

  Future<List<Document>> getPosts() async {
    final document = await _databases.listDocuments(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.postCollection,
        queries: [Query.orderDesc('createdAt')]);
    return document.documents.toList();
  }

  Stream<RealtimeMessage> getLastestPosts() {
    return _realtime.subscribe([
      'databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.postCollection}.documents.*.create'
    ]).stream;
  }

  Future<Document> getcurrentUserDetails(String uid) async {
    final document = _databases.getDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.userdatabase,
        documentId: uid);
    return document;
  }

  // Future<Document> likePost () async{
  //   // TODO: implement likePost
  //   final documents = await _databases.updateDocument(databaseId: AppwriteConstants.projectdatabases, collectionId: AppwriteConstants.postCollection, documentId: documentId, data: {
  //     "likes" :
  //   });
  //   return documents;
  // }
}