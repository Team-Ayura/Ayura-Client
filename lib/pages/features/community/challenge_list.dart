import 'package:flutter/material.dart';
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
                    communityName: 'Colombo Active Life',
                    challengeName: 'Cycle Strong Series',
                    challengeType: 'Cycling',
                    remainingTime: '7 Days',
                    completedCount: '12.6',
                    totalCount: '20 km',
                    startingDate: '09/01',
                    endingDate: '09/07',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'CardioBuddy - Colombo',
                    challengeName: 'Speed Boost Challenge',
                    challengeType: 'Running',
                    remainingTime: '7 Days',
                    completedCount: '2.3',
                    totalCount: '12 km',
                    startingDate: '09/01',
                    endingDate: '09/07',
                  ),
                  ChallengeCard(
                    //Must Pass other data also, such as challenge data
                    communityName: 'Diabetes Support Circle',
                    challengeName: 'Walk for Health',
                    challengeType: 'Walking',
                    remainingTime: '2 Days',
                    completedCount: '3.6',
                    totalCount: '5 km',
                    startingDate: '09/01',
                    endingDate: '09/07',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
