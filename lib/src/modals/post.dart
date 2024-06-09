import 'package:flutter/material.dart';

/// here the Post model is created
@immutable
class Post {
  final String userid;
  final List<String> hashtags;
  final String links;
  final DateTime createdAt;
  final String postid;
  final String posttext;
  final List<String> likes;
  // final List<Post> comments;
  final List<String> imageLinks;
  final String repliedTo;

  const Post(
      {required this.createdAt,
      required this.repliedTo,
      required this.hashtags,
      required this.links,
      required this.userid,
      required this.postid,
      required this.posttext,
      required this.likes,
      // required this.comments,
      required this.imageLinks});

  Post copyWith({
    String? userid,
    List<String>? hashtags,
    String? repliedTo,
    String? links,
    DateTime? createdAt,
    String? postid,
    String? posttext,
    List<String>? likes,
    List<Post>? comments,
    List<String>? imageLinks,
  }) {
    return Post(
      repliedTo: repliedTo ?? this.repliedTo,
        createdAt: createdAt ?? this.createdAt,
        hashtags: hashtags ?? this.hashtags,
        links: links ?? this.links,
        userid: userid ?? this.userid,
        posttext: posttext ?? this.posttext,
        likes: likes ?? this.likes,
        // comments: comments ?? this.comments,
        imageLinks: imageLinks ?? this.imageLinks,
        postid: postid ?? this.postid);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({"repliedTo": repliedTo});
    result.addAll({"userid": userid});
    result.addAll({"likes": likes});
    // result.addAll({"comments": comments});
    result.addAll({"imageLinks": imageLinks});
    result.addAll({"createdAt": createdAt.millisecondsSinceEpoch});
    result.addAll({"hashtags": hashtags});
    result.addAll({"links": links});
    result.addAll({"userid": userid});
    result.addAll({"posttext": posttext});
    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      repliedTo: map['repliedTo'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      hashtags: List<String>.from(map['hashtags']),
      links: map['links'] ?? "",
      userid: map['userid'] ?? "",
      postid: map['\$id'] ?? "",
      posttext: map['posttext'] ?? "",
      likes: List<String>.from(map["likes"]),
      // comments: List<Post>.from(map['comments']),
      imageLinks: List<String>.from(map['imageLinks']),
    );
  }

  @override
  String toString() {
    return " Post(userid: $userid, postid: $postid, posttext: $posttext, likes: $likes, imageLinks: $imageLinks, createdAt: $createdAt, hashtags: $hashtags, links: $links,) ";
  }
}
