import 'package:flutter/material.dart';

// Constants
import 'package:ayura/constants/colors.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard(
      {required this.challengeName,
      required this.challengeType,
      required this.communityName,
      required this.remainingTime,
      required this.completedCount,
      required this.totalCount,
      required this.startingDate,
      required this.endingDate,
      this.margin = 10,
      this.padding = 20,
      super.key});

  //Challenge Name, Challenge Type, Community Name
  final String challengeName;
  final String challengeType;
  final String communityName;
  final String remainingTime;
  final String completedCount;
  final String totalCount;
  final String startingDate;
  final String endingDate;
  final double margin;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.fromLTRB(0, margin, 0, margin),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                Icons.group_outlined,
                color: Color.fromRGBO(11, 183, 80, 1),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                communityName,
                style: const TextStyle(
                  color: Color.fromRGBO(11, 183, 80, 1),
                  fontFamily: 'Inter',
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                remainingTime,
                style: const TextStyle(
                    color: AppColors.textColor, fontFamily: 'Inter'),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    challengeName,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    challengeType,
                    style: const TextStyle(
                        color: AppColors.textColor, fontFamily: 'Inter'),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Text(
                '$completedCount/',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(
                totalCount,
                style: const TextStyle(
                  color: AppColors.alternateGreyColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(
                8.0), // Adjust the radius to control the curve ending

            child: const LinearProgressIndicator(
              value: 0.5,
              backgroundColor: AppColors
                  .alternateGreyColor, // Background color of the progress bar
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryColor), // Color of the progress indicator
              minHeight: 10, // Minimum height of the progress bar
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Starting date : $startingDate',
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
             'Ending date $endingDate',
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
