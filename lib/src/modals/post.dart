import 'package:flutter/material.dart';
/// here the Post model is created
@immutable
class Post {
  final String username;
  final String postid;
  final String content;
  final int likes;
  final int comments;
  final String imageUrl;

  const Post(
      {required this.username,
      required this.postid,
      required this.content,
      required this.likes,
      required this.comments,
      required this.imageUrl});

  Post copyWith({
    String? username,
    String? postid,
    String? content,
    int? likes,
    int? comments,
    String? imageUrl,
  }) {
    return Post(
        postid: postid ?? this.postid,
        username: username ?? this.username,
        content: content ?? this.content,
        likes: likes ?? this.likes,
        comments: comments ?? this.comments,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({"postid": postid});
    result.addAll({"likes": likes});
    result.addAll({"comments": comments});
    result.addAll({"imageurl": imageUrl});
    result.addAll({});
    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        username: map['username'] ?? "",
        postid: map['postid'] ?? "",
        content: map['content'] ?? "",
        likes: map["likes"] ?? "",
        comments: map['comments'] ?? '',
        imageUrl: map['imageUrl'] ?? '');
  }

  @override
  String toString() {
    return " Post(username: $username, postid: $postid, content: $content, likes: $likes, comments: $comments, imageUrl: $imageUrl) ";
  }
}
