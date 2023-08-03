import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:ayura/utils/router.dart';
// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
// Feature Widgets
import 'package:ayura/widgets/features/community/challenge_card.dart'; // Chat Card Widget

class ChallengeList extends StatelessWidget {
  const ChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_run,
                  color: AppColors.textColor,
                ),
                SizedBox(width: 8),
                Text(
                  'Challenges List',
                  style: AppStyles.subheadingTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: const [
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'LSEG Running',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '1.6',
                    totalCount: '2 km',
                  ),
                  // Add more ChatCard widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
