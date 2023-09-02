import 'dart:typed_data';

class PostModel {
  String id;
  String caption;
  String imageUrl;
  String authorId;
  String communityId;
  String authorName;
  List<String> comments;

// Constructor
  PostModel({
    required this.id,
    required this.caption,
    required this.imageUrl,
    required this.authorId,
    required this.communityId,
    required this.authorName,
    List<String>? comments, // Initialize as empty list
  }) : comments = comments ?? [];

  // Factory constructor to create CommunityModel from JSON data
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      caption: json['caption'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      authorId: json['authorId'] ?? '',
      authorName: json['authorName'] ?? '',
      communityId: json['communityId'] ?? '',
      comments: List<String>.from(json['comments'] ?? []),
    );
  }

  // Convert the object to JSON format for API requests.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'caption': caption,
      'imageUrl': imageUrl,
      'authorId': authorId,
      'authorName': authorName,
      'communityId': communityId,
      'comments': comments,
    };
  }
}
