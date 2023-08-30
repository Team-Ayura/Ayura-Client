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
    required this.categories,
    required this.members,
  });

  // Factory constructor to create CommunityModel from JSON data
  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['_id'],
      communityName: json['communityName'],
      communityDescription: json['communityDescription'],
      isPublic: json['isPublic'],
      categories: List<String>.from(json['categories']),
      members: List<String>.from(json['members']),
    );
  }

  // Convert the object to JSON format for API requests.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'communityName': communityName,
      'communityDescription': communityDescription,
      'isPublic': isPublic,
      'categories': categories,
      'members': members,
    };
  }

}
