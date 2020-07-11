///
/// Created By Guru (guru@smarttersstudio.com) on 11/07/20 8:41 PM
///
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.name,
    this.id,
    this.title,
    this.description,
    this.timestamp,
  });
  
  String name;
  String id;
  String title;
  String description;
  DateTime timestamp;
  
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json["name"],
    id: json["id"],
    title: json["title"],
    description: json["description"],
    timestamp: DateTime.parse(json["timestamp"]),
  );
  
  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "title": title,
    "description": description,
    "timestamp": timestamp.toIso8601String(),
  };
}
