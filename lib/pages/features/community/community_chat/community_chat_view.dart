import 'package:ayura/widgets/features/community/header_btn.dart';
import 'package:flutter/material.dart';

import 'package:ayura/pages/features/community/community_chat/posts_view.dart';
import 'package:ayura/pages/features/community/community_chat/leaderboard_view.dart';
import 'package:ayura/pages/features/community/community_chat/challenge_details_view.dart';

//Constants
import 'package:ayura/constants/colors.dart';

// Feature Widgets
import 'package:ayura/widgets/features/community/community_appbar.dart';

class CommunityChat extends StatefulWidget {
  const CommunityChat({super.key});

  @override
  State<CommunityChat> createState() {
    return _CommunityChatState();
  }
}

class _CommunityChatState extends State<CommunityChat> {
  String activeComponent = 'Overview'; // Keeps track of the active UI component

  void updateActiveComponent(String component) {
    setState(() {
      activeComponent = component;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: CommunityAppBar(
          appbarTitle: 'Colombo Active Life',
          visibility: 'Public',
          memberCount: '210',
        ),
      ),
      body: Container(
        width: double.infinity, //Take the whole available width of the device
        padding: EdgeInsets.fromLTRB(
            width * 0.02, height * 0.01, width * 0.02, height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //The 3 buttons
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderButton(
                  buttonName: 'Overview',
                  onPressed: () => updateActiveComponent('Overview'),
                  isActive: activeComponent == 'Overview',
                ),
                HeaderButton(
                  buttonName: 'Leaderboard',
                  onPressed: () => updateActiveComponent('Leaderboard'),
                  isActive: activeComponent == 'Leaderboard',
                ),
                HeaderButton(
                  buttonName: 'Challenges',
                  onPressed: () => updateActiveComponent('Challenge'),
                  isActive: activeComponent == 'Challenge',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (activeComponent == 'Overview') //Posts View
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Checkout the latest posts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: AppColors.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      PostsView(
                        username: "Ruchira Bogahawatta",
                        timeAgo: "10 mins ago",
                        challengeDescription:
                            "Challenge : Complete a 1 kilometer run in 3 consecutive days",
                      ),
                      PostsView(
                        username: "Dinuka A",
                        timeAgo: "45 mins ago",
                        challengeDescription:
                            "Challenge : Complete a 10km cycling ride in 5 consecutive days",
                      ),
                      PostsView(
                        username: "Namadee Shakya",
                        timeAgo: "2 hrs ago",
                        challengeDescription:
                            "Challenge :  Complete a 10km walk within a week",
                      ),
                    ],
                  ),
                ),
              )
            else if (activeComponent == 'Leaderboard')
              const LeaderboardView()
            else if (activeComponent == 'Challenge')
              const ChallengeDetailsView()
          ],
        ),
      ),
    );
  }
}
