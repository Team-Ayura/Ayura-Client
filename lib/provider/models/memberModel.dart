class MemberModel {
  String id;
  String email;
  String firstName;
  String lastName;
  List<String> joinedCommunities;

  MemberModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.joinedCommunities});

  // Factory constructor to create MemberModel from JSON data
  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        id: json['id'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? false,
        joinedCommunities: List<String>.from(json['joinedCommunities'] ?? []));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email
    };
  }
}
