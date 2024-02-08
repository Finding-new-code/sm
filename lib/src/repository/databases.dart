import 'package:appwrite/models.dart' as models;
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
        collectionId: AppwriteConstants.usercollection,
        documentId: id,
        data: user.toMap());
  }

  Future<List<models.Document>> searchUsersByName(String user) async {
    final document = await _databases.listDocuments(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.usercollection,
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

  Future<List<models.Document>> getPosts() async {
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

  Future<models.Document> getcurrentUserDetails(String uid) {
    return _databases.getDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.usercollection,
        documentId: uid);
  }

  Future<models.Document> likePost(Post post) async {
    // TODO: implement likePost
    final documents = await _databases.updateDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.postCollection,
        documentId: post.postid,
        data: {"likes": post.likes});
    return documents;
  }

  Future<List<Document>> getRepliesToTweet(Post post) async {
    final document = await _databases.listDocuments(
      databaseId: AppwriteConstants.projectdatabases,
      collectionId: AppwriteConstants.postCollection,
      queries: [
        Query.equal('repliedTo', post.postid),
      ],
    );
    return document.documents;
  }

  Future<List<Document>> getUserTweets(String uid) async {
    final documents = await _databases.listDocuments(
      databaseId: AppwriteConstants.projectdatabases,
      collectionId: AppwriteConstants.postCollection,
      queries: [
        Query.equal('userid', uid),
      ],
    );
    return documents.documents;
  }

  Future<void> addtoFollowing(UserModel user) async {
    await _databases.updateDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.usercollection,
        documentId: user.userid,
        data: {
          'following' : user.following
        });
  }

  Future<void> followuser (UserModel user) async{
    await _databases.updateDocument(
        databaseId: AppwriteConstants.projectdatabases,
        collectionId: AppwriteConstants.usercollection,
        documentId: user.userid,
        data: {
          'followers' : user.followers
        });
  }

  Stream<RealtimeMessage> getRealtimeProfileUpdates() {
    return _realtime.subscribe([
      'databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.usercollection}.documents.*.update'
    ]).stream;
  
  }
  
}
