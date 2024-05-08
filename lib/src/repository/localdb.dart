
import 'package:hive/hive.dart';
import 'package:myapp658d7b3746ed317621f8/src/src.dart';

class LocalDatabase {
  final postdb = Hive.box(name: 'post_local_databases');
  final userdb = Hive.box(name: 'user_local_databases');
  final commentdb = Hive.box(name: 'comment_local_databases');

  void uploadPostsTolocaldb(List<Post> posts) {
    postdb.clear();
    for (int i = 0; i <= posts.length; i++) {
      postdb.write(() {
        postdb.put('$i', posts[i]);
      });
    }
  }

  void uploadPostsUserTolocaldb(List<UserModel> user) {
    postdb.clear();
    for (int i = 0; i <= user.length; i++) {
      postdb.write(() {
        postdb.put('$i', user[i]);
      });
    }
  }

  List<UserModel> fetchPostUserFromdb() {
    List<UserModel> user = [];
    userdb.read(() {
      for (int i = 0; i < userdb.length; i++) {
        user.add(UserModel.fromMap(userdb.get(i.toString())));
      }
    });

    return user;
  }

  void loadUserToLocaldb(UserModel user) {
    userdb.put('user', user);
  }

  List<Post> fetchPostsFromlocaldb() {
    List<Post> posts = [];
    postdb.read(() {
      for (int i = 0; i < postdb.length; i++) {
        posts.add(Post.fromMap(postdb.get(i.toString())));
      }
    });

    return posts;
  }

  UserModel fetchUserFromlocaldb() {
    return userdb.get('user');
  }
}
