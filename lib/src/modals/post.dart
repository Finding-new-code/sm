import 'package:flutter/material.dart';

/// here the Post model is created
@immutable
class Post {
  final String username;
  final List<String> hashtags;
  final String links;
  final DateTime createdAt;
  final String postid;
  final String posttext;
  final int likes;
  final List<String> commentsid;
  final String imageUrl;

  const Post(
      {required this.createdAt,
      required this.hashtags,
      required this.links,
      required this.username,
      required this.postid,
      required this.posttext,
      required this.likes,
      required this.commentsid,
      required this.imageUrl});

  Post copyWith({
    String? username,
    List<String>? hashtags,
    String? links,
    DateTime? createdAt,
    String? postid,
    String? posttext,
    int? likes,
    List<String>? commentsid,
    String? imageUrl,
  }) {
    return Post(
        createdAt: createdAt ?? this.createdAt,
        hashtags: hashtags ?? this.hashtags,
        links: links ?? this.links,
        username: username ?? this.username,
        postid: postid ?? this.postid,
        posttext: posttext ?? this.posttext,
        likes: likes ?? this.likes,
        commentsid: commentsid ?? this.commentsid,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({"postid": postid});
    result.addAll({"likes": likes});
    result.addAll({"commentsid": commentsid});
    result.addAll({"imageurl": imageUrl});
    result.addAll({"createdat": createdAt});
    result.addAll({"hashtags": hashtags});
    result.addAll({"links": links});
    result.addAll({"username": username});
    result.addAll({"posttext": posttext});
    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        createdAt: map['createdat'] ?? "",
        hashtags: map['hashtags'] ?? [],
        links: map['links'] ?? "",
        username: map['username'] ?? "",
        postid: map['postid'] ?? "",
        posttext: map['posttext'] ?? "",
        likes: map["likes"] ?? "",
        commentsid: map['commentsid'] ?? '',
        imageUrl: map['imageUrl'] ?? '');
  }

  @override
  String toString() {
    return " Post(username: $username, postid: $postid, posttext: $posttext, likes: $likes, commentsid: $commentsid, imageUrl: $imageUrl, createdAt: $createdAt, hashtags: $hashtags, links: $links) ";
  }
}
