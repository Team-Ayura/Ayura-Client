import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:ayura/constants/constants.dart';
import 'package:ayura/provider/models/community_model.dart';

class CommunityProvider extends ChangeNotifier {
  // Get BaseURL
  final requestBaseUrl = AppUrls.baseUrl;

  //Community Object
  final CommunityModel _communityModel = CommunityModel(
    id: "",
    communityName: "",
    communityDescription: "",
    isPublic: true,
    categories: [],
    members: [],
  );

  // Getters
  String get id => _communityModel.id;
  String get communityName => _communityModel.communityName;
  String get communityDescription => _communityModel.communityDescription;
  bool get isPublic => _communityModel.isPublic;
  List get categories => _communityModel.categories;
  List get members => _communityModel.members;

  // Setter Function
  void updateCommunityInfo(CommunityModel community) {
    _communityModel.id = community.id;
    _communityModel.communityName = community.communityName;
    _communityModel.communityDescription = community.communityDescription;
    _communityModel.isPublic = community.isPublic;
    _communityModel.categories = community.categories;
    _communityModel.members = community.members;
    notifyListeners();
  }
}
