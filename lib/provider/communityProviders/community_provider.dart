import 'package:ayura/provider/models/memberModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ayura/constants/constants.dart';
import 'package:ayura/provider/models/community_model.dart';

class CommunityProvider extends ChangeNotifier {
  final requestBaseUrl = AppUrls.baseUrl;
  final CommunityModel _communityModel = CommunityModel(
    id: "",
    communityName: "",
    communityDescription: "",
    isPublic: true,
    categories: [],
    members: [],
  );
  List<CommunityModel> _communityList = [];
  List<MemberModel> _membersList = [];
  String _resMessage = '';

  List<CommunityModel> get communityList => _communityList;
  List<MemberModel> get memberList => _membersList;
  String get id => _communityModel.id;
  String get communityName => _communityModel.communityName;
  String get communityDescription => _communityModel.communityDescription;
  bool get isPublic => _communityModel.isPublic;
  List get categories => _communityModel.categories;
  List get members => _communityModel.members;
  String get resMessage => _resMessage;

  void updateCommunityInfo(CommunityModel community) {
    _communityModel.id = community.id;
    _communityModel.communityName = community.communityName;
    _communityModel.communityDescription = community.communityDescription;
    _communityModel.isPublic = community.isPublic;
    _communityModel.categories = community.categories;
    _communityModel.members = community.members;
    notifyListeners();
  }

  //Get the communities from database
  Future<void> getCommunitiesList() async {
    final url = '$requestBaseUrl/api/communities';

    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        _communityList = List<CommunityModel>.from(res.map<CommunityModel>(
          (communityData) => CommunityModel.fromJson(communityData),
        ));
      } else {
      }
    } catch (error) {
    }
    notifyListeners();
  }

  //Create community
  Future<void> createCommunity(CommunityModel community) async {
    final url = '$requestBaseUrl/api/communities/create';

    try {
      final body = community.toJson(); // Convert the community model to JSON
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );

      final res = json.decode(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        await getCommunitiesList(); // Fetch the updated community list
      } else {
      }
    } catch (error) {
    }
    notifyListeners();
  }

  //Add member
  Future<void> addMember(String communityId, String email) async {
    final url = '$requestBaseUrl/api/communities/addMember';

    final Map<String, String> headers = {'Content-Type': 'application/json'};

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
      // You can handle any success logic here
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
      } else {
      }
    } catch (error) {
    }
    notifyListeners();
  }
}
