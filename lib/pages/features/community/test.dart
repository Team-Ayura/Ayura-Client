import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:ayura/provider/models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommunityListScreen extends StatefulWidget {
  @override
  State<CommunityListScreen> createState() => _CommunityListScreenState();
}

class _CommunityListScreenState extends State<CommunityListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommunityProvider>(context, listen: false).getCommunitiesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community List')),
      body: Consumer<CommunityProvider>(
        builder: (context, communityProvider, _) {
          List<CommunityModel> communities = communityProvider.communityList;
          print('Community List: ${communities.length}');
          return ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              CommunityModel community = communities[index];
              return ListTile(
                title: Text(community.communityName),
                subtitle: Text(community.communityDescription),
              );
            },
          );
        },
      ),
    );
  }
}
