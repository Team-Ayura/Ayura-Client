class CommunityModel {
  String id;
  String communityName;
  String communityDescription;
  bool isPublic;
  List<String> categories;
  List<String> members;

  // Constructor
  CommunityModel({
    required this.id,
    required this.communityName,
    required this.communityDescription,
    required this.isPublic,
    List<String>? categories, // Initialize as empty list
    List<String>? members, // Initialize as empty list
  })  : categories = categories ?? [],
        members = members ?? [];

  // Factory constructor to create CommunityModel from JSON data
  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? '',
      communityName: json['communityName'] ?? '',
      communityDescription: json['communityDescription'] ?? '',
      isPublic: json['isPublic'] ?? false,
      categories: List<String>.from(json['categories'] ?? []),
      members: List<String>.from(json['members'] ?? []),
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
    };
  }
}
