import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:ayura/provider/communityProviders/community_provider.dart';
// Community Feature Widgets
import 'package:ayura/widgets/features/community/chat_card.dart'; // Chat Card Widget
import 'package:ayura/widgets/features/community/search_box.dart'; // SearchBox Widget
import 'package:ayura/widgets/features/community/challenge_card.dart'; // Challenge Card Widget
import 'package:ayura/pages/features/community/community_list.dart';
import 'package:ayura/pages/features/community/challenge_list.dart';

// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
// Community Pages
import 'package:ayura/pages/features/community/create_community.dart';
import 'package:ayura/provider/models/community_model.dart';

class CommunityHome extends StatefulWidget {
  const CommunityHome({super.key});

  @override
  State<CommunityHome> createState() {
    return _CommunityHomeState();
  }
}

class _CommunityHomeState extends State<CommunityHome> {
  void openCreateCommunityOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const CreateCommunity(),
    );
  }

  void openCommunityListOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const CommunityList(),
    );
  }

  void openChallengeListOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const ChallengeList(),
    );
  }

 // Init State
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(90.0), // Set the preferred size here.
        child: CustomAppBar(
          appbarTitle: 'Community',
          onPressed: openCreateCommunityOverlay,
          iconName: Icons.add,
        ),
      ),
      body: Container(
        //add padding
        width: double.infinity, //Take the whole available width of the device
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Search Box
            const SearchBox(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CommunityProvider>(
                    builder: (context, community, child) {
                  return Text(
                    community.communityName,
                    style: AppStyles.subheadingTextStyle2,
                  );
                }),
                TextButton(
                  onPressed: openCommunityListOverlay,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              // Main Chats Container
              height: MediaQuery.of(context).size.height * 0.35,
              child: const SingleChildScrollView(
                //Making the container Scrollabble
                // GET Community List
                child: Column(
                  children: [
                    ChatCard(
                        communityName: 'Colombo Active Life',
                        visibiity: 'Public',
                        memberCount: '184'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '72'),
                    ChatCard(
                        communityName: 'CardioBuddy - Colombo',
                        visibiity: 'Public',
                        memberCount: '310'),
                    ChatCard(
                        communityName: 'Wellness Waves Community',
                        visibiity: 'Public',
                        memberCount: '515'),
                    ChatCard(
                        communityName: 'Joyful Wellness Journey',
                        visibiity: 'Private',
                        memberCount: '40'),
                    ChatCard(
                        communityName: 'DiabetesCare',
                        visibiity: 'Private',
                        memberCount: '10'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Upcoming Challenges',
                    style: AppStyles.subheadingTextStyle2),
                TextButton(
                  onPressed: openChallengeListOverlay,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              // Challenge Container
              child: ChallengeCard(
                //Must Pass other data also, such as challenge data
                communityName: 'Colombo Active Life',
                challengeName: 'Cycle Strong Series',
                challengeType: 'Cycling',
                remainingTime: '7 Days',
                completedCount: '12.6',
                totalCount: '20 km',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
