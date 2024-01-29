import 'package:flutter/material.dart';
/// here the user model which stores the user data send and received from the server 

@immutable
class UserModel {
  final String name;
  final String bio;
  final String profilePicture;
  final String userId;
  final String bannerPicture;
  final bool isPremium;
  final List<String> followers;
  final List<String> following;
  final String location;
  final String email;
  final List<String> posts;
  final List<String> likedPosts;

 const UserModel(
      {required this.name,
      required this.bio,
      required this.profilePicture,
      required this.userId,
      required this.bannerPicture,
      required this.isPremium,
      required this.followers,
      required this.following,
      required this.location,
      required this.email,
      required this.posts,
      required this.likedPosts});

  UserModel copyWith({
    String? name,
    String? bio,
    String? profilePicture,
    String? userId,
    String? bannerPicture,
    bool? isPremium,
    List<String>? followers,
    List<String>? following,
    String? location,
    String? email,
    List<String>? posts,
    List<String>? likedPosts,
  }) {
    return UserModel(
        name: name ?? this.email,
        bio: bio ?? this.bio,
        profilePicture: profilePicture ?? this.profilePicture,
        userId: userId ?? this.userId,
        bannerPicture: bannerPicture ?? this.bannerPicture,
        isPremium: isPremium ?? this.isPremium,
        followers: followers ?? this.followers,
        following: following ?? this.following,
        location: location ?? this.location,
        email: email ?? this.email,
        posts: posts ?? this.posts,
        likedPosts: likedPosts ?? this.likedPosts,);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({"name": name});
    result.addAll({"bio": bio});
    result.addAll({"profilePicture": profilePicture});
    result.addAll({"bannerPicture": bannerPicture});
    result.addAll({"isPremium": isPremium});
    result.addAll({"followers": followers});
    result.addAll({"following": following});
    result.addAll({"location": location});
    result.addAll({"email": email});
    result.addAll({"posts": posts});
    result.addAll({"likedPosts": likedPosts});
    result.addAll({"userId" : userId});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map["email"] ?? "",
        bio: map["bio"] ?? "",
        profilePicture: map["profilePicture"] ?? "",
        userId: map["\$id"],
        bannerPicture: map["bannerPicture"] ?? "",
        isPremium: map["isPremium"] ?? false,
        followers: List<String>.from(map["folowers"]),
        following: List<String>.from(map["folowing"]),
        location: map["location"] ?? "",
        email: map["email"] ?? "",
        posts: map["posts"] ?? "",
        likedPosts: map["likedPosts"] ?? "");
  }

  @override
  String toString() {
    return "UserModel(name: $name, bio: $bio, profilePicture: $profilePicture, userId: $userId, bannerPicture: $bannerPicture, isPremium: $isPremium, followers: $followers, following: $following, location: $location, email: $email, posts: $posts, likedPosts: $likedPosts)";
  }
}