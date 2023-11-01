import 'package:ayura/provider/models/memberModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ayura/constants/constants.dart';
import 'package:ayura/provider/models/community_model.dart';
import 'package:ayura/provider/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ayura/constants/enums.dart';

class CommunityProvider extends ChangeNotifier {
  bool isLoading = false; // For Loading animation
  final requestBaseUrl = AppUrls.baseUrl;
  CommunityModel _communityModel = CommunityModel(
    id: "",
    communityName: "",
    communityDescription: "",
    adminId: '',
    isPublic: true,
    categories: [],
    members: [],
    challenges: [],
  );
  List<CommunityModel> _communityList = [];
  List<CommunityModel> _userJoinedCommunityList = [];
  List<PostModel> _postsList = [];
  List<MemberModel> _membersList = [];
  String _resMessage = '';

  PostModel _postModel = PostModel(
      id: "",
      caption: "",
      imageUrl: "",
      authorId: "",
      communityId: "",
      authorName: "");
  // Getters
  CommunityModel get communityModel => _communityModel;
  PostModel get postModel => _postModel;
  List<CommunityModel> get communityList => _communityList;
  List<CommunityModel> get userJoinedCommunityList => _userJoinedCommunityList;

  List<PostModel> get postsList => _postsList;
  List<MemberModel> get memberList => _membersList;
  String get id => _communityModel.id;
  String get communityName => _communityModel.communityName;
  String get communityDescription => _communityModel.communityDescription;
  bool get isPublic => _communityModel.isPublic;
  List get categories => _communityModel.categories;
  List get members => _communityModel.members;
  List get challenges => _communityModel.challenges;
  String get adminId => _communityModel.adminId;

  String get resMessage => _resMessage;

  void updateCommunityInfo(CommunityModel community) {
    _communityModel.id = community.id;
    _communityModel.communityName = community.communityName;
    _communityModel.communityDescription = community.communityDescription;
    _communityModel.isPublic = community.isPublic;
    _communityModel.categories = community.categories;
    _communityModel.members = community.members;
    _communityModel.challenges = community.challenges;
    notifyListeners();
  }

  //Get the communities from database
  Future<void> getCommunitiesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final token = prefs.getString('token');

    final url = '$requestBaseUrl/api/communities/public/$userId';
    isLoading = true;

    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      final res = json.decode(req.body);
      print('Inside try block');

      if (req.statusCode == 200 || req.statusCode == 201) {
        _communityList = List<CommunityModel>.from(res.map<CommunityModel>(
          (communityData) => CommunityModel.fromJson(communityData),
        ));
        print('Public Community List Fetched: $_communityList');
        isLoading = false;
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }

    notifyListeners();
  }

  // User Joined communities
  Future<void> getUserJoinedCommunities() async {
    print("inside getUserJoinedCommunities");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final token = prefs.getString('token');
    print(userId);
    print(token);

    final url = '$requestBaseUrl/api/communities/joined/$userId';
    isLoading = true;

    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      final res = json.decode(req.body);
      if (req.statusCode == 200 || req.statusCode == 201) {
        _userJoinedCommunityList =
            List<CommunityModel>.from(res.map<CommunityModel>(
          (communityData) => CommunityModel.fromJson(communityData),
        ));
        print('User Joined Community List Fetched: $_userJoinedCommunityList');
        isLoading = false;
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }

    notifyListeners();
  }

  //Create community
  Future<void> createCommunity(CommunityModel community) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userId = prefs.getString('userId');

    final url = '$requestBaseUrl/api/communities';
    print('Inside createCommunity');

    try {
      final body = community.toJson(); // Convert the community model to JSON
      body["adminId"] = userId;
      body["members"] = [userId];

      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );

      print("Response Status Code: ${req.statusCode}");
      print("Response Body: ${req.body}");

      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        await getUserJoinedCommunities(); // Fetch the updated community list
      } else {
        print("Res Error Occurred $res");
      }
    } catch (error) {
      print("Error Occurred $error");
    }
    notifyListeners();
  }

  //Add member
  Future<void> addMember(String communityId, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    final url = '$requestBaseUrl/api/communities/addMember';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final Map<String, dynamic> requestBody = {
      'communityId': communityId,
      'userEmail': email,
    };

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      _resMessage = 'Member added Successfully';
      // Member added successfully
      notifyListeners();
    } else {
      // Handle error response
      _resMessage = 'Cannot find user';
      throw Exception('Failed to add member to the community');
    }
    notifyListeners();
  }

  //Get the members list from database
  Future<void> getMembersList(id) async {
    final url = '$requestBaseUrl/api/communities/getMembers/$id';

    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        _membersList = List<MemberModel>.from(res.map<MemberModel>(
          (memberData) => MemberModel.fromJson(memberData),
        ));
      } else {}
    } catch (error) {}
    notifyListeners();
  }

  //Get the community by id
  Future<void> getCommunityById(String communityId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);

    final url = '$requestBaseUrl/api/communities/$communityId';
    isLoading = true;
    notifyListeners();
    try {
      print('Inside getCommunitiesList');
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      final res = json.decode(req.body);
      print('API Response: $res');
      print('Status Code: ${req.statusCode}');

      if (req.statusCode == 200 || req.statusCode == 201) {
        _communityModel = CommunityModel.fromJson(res);
        print('Community Fetched: $_communityModel');

        print('Community List Fetched: $_communityList');
        isLoading = false;
        notifyListeners();
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  // Submit Post
  Future<void> submitPost(PostModel newPost) async {
    final url = '$requestBaseUrl/api/communities/post';

    try {
      final body = newPost.toJson(); // Convert the community model to JSON
      print('JSON Body: ${json.encode(body)}');
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );

      final res = json.decode(req.body);
      print('Create POST Response: $res');
      print('Create POST Status Code: ${req.statusCode}');

      if (req.statusCode == 200 || req.statusCode == 201) {
        await getPostsList(newPost.communityId); // Fetch the updated posts list
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }
    notifyListeners();
  }

  Future<void> getPostById(String postId) async {
    final url = '$requestBaseUrl/api/communities/post/$postId';
    isLoading = true;
    notifyListeners();
    try {
      print('Inside getCommunitiesList');
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      final res = json.decode(req.body);
      print('API Response: $res');
      print('Status Code: ${req.statusCode}');

      if (req.statusCode == 200 || req.statusCode == 201) {
        _postModel = PostModel.fromJson(res);
        print('Community Fetched: $_postModel');

        print('Community List Fetched: $_postModel');
        isLoading = false;
        notifyListeners();
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> getPostsList(communityId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print(token);
    final url = '$requestBaseUrl/api/communities/posts/$communityId';
    isLoading = true;
    notifyListeners();
    try {
      print('Inside getPostsList');
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        _postsList = List<PostModel>.from(res.map<PostModel>(
          (postData) => PostModel.fromJson(postData),
        ));
        print('Posts List Fetched: $_postsList');
        isLoading = false;
        notifyListeners();
      } else {
        print("Error Occurred $res");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  //JOIN MEMBER
  Future<void> joinMember(String communityId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get email
    final email = prefs.getString('email')!;
    var communityID = communityId;

    //get email and community ID
    addMember(communityId, email);

    notifyListeners();
  }

  //Get AdminId
  Future<String> getAdminId(String communityId) async {
    await getCommunityById(communityId); // Fetch the community data
    String adminId = _communityModel.adminId; // Access the adminId
    return adminId;
  }
}
