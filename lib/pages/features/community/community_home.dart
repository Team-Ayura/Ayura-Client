import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
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
                const Text('Your Communities',
                    style: AppStyles.subheadingTextStyle2),
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
              height: MediaQuery.of(context).size.height * 0.3,
              child: const SingleChildScrollView(
                //Making the container Scrollabble
                child: Column(
                  children: [
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
                    ChatCard(
                        communityName: 'Diabetes Control Circle',
                        visibiity: 'Private',
                        memberCount: '55'),
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
                communityName: 'Diabetes Support Circle',
                challengeName: 'LSEG Running',
                challengeType: 'Running',
                remainingTime: '7 Days',
                completedCount: '1.6',
                totalCount: '2 km',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigation(),
    );
  }
}
