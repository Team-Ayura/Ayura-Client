class UserModel {
  String gender;
  int weight;
  int height;
  String activityLevel;
  String firstName;
  String lastName;
  String email;
  String birthday;
  String nationality;
  String bloodGroup;
  String password;

  UserModel({
    required this.gender,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthday,
    required this.nationality,
    required this.bloodGroup,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'weight': weight,
      'height': height,
      'activityLevel': activityLevel,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'birthday': birthday,
      'nationality': nationality,
      'bloodGroup': bloodGroup,
      'password': password,
    };
  }
}
