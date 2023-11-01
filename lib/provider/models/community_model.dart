class CommunityModel {
  String id;
  String communityName;
  String communityDescription;
  String adminId;
  bool isPublic;
  List<String> categories;
  List<String> members;
  List<String> challenges;

  // Constructor
  CommunityModel({
    required this.id,
    required this.communityName,
    required this.communityDescription,
    required this.isPublic,
    List<String>? categories, // Initialize as empty list
    List<String>? challenges, // Initialize as empty list
    required this.adminId,
    List<String>? members, // Initialize as empty list
  })  : categories = categories ?? [],
        members = members ?? [],
        challenges = challenges ?? [];

  // Factory constructor to create CommunityModel from JSON data
  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? '',
      communityName: json['communityName'] ?? '',
      communityDescription: json['communityDescription'] ?? '',
      isPublic: json['isPublic'] ?? false,
      categories: List<String>.from(json['categories'] ?? []),
      adminId: json['adminId'] ?? '',
      members: List<String>.from(json['members'] ?? []),
      challenges: List<String>.from(json['challenges'] ?? []),
    );
  }

  // Convert the object to JSON format for API requests.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'communityName': communityName,
      'communityDescription': communityDescription,
      'isPublic': isPublic,
      'categories': categories,
      'members': members,
      'challenges': challenges,
      'adminId': adminId,
    };
  }
}
