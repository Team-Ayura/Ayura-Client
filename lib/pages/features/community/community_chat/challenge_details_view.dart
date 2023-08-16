import 'package:ayura/widgets/features/community/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_button.dart';

//Constants
import 'package:ayura/constants/colors.dart';

class ChallengeDetailsView extends StatefulWidget {
  const ChallengeDetailsView({super.key});

  @override
  State<ChallengeDetailsView> createState() {
    return _ChallengeDetailsViewState();
  }
}

class _ChallengeDetailsViewState extends State<ChallengeDetailsView> {
  String activeComponent =
      'Challenge 1'; // Keeps track of the active UI component

  final List<String> dropdownItems = ['Running', 'Walking', 'Hello'];
  void updateActiveComponent(String component) {
    setState(() {
      activeComponent = component;
    });
  }

  @override
  Widget build(BuildContext context) {
    Container challengeDetailsContainer({
      required String challengeTitle,
      required String challenge,
      required String highestScore,
      required String attempted,
    }) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              challengeTitle,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              challenge,
              style: const TextStyle(
                fontFamily: 'Inter',
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to earn points?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '1. Participants will earn 30 points for each day of running',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '2. Participants will earn 30 points for completing the full distance.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            customButton(
              tap: null,
              width: 140,
              text: 'Try Now',
              icon: Icons.arrow_forward,
              context: context,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Highest Score - $highestScore Points',
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.alternateGreyColor,
                      fontSize: 13),
                ),
                Text(
                  'Attempted - $attempted',
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.alternateGreyColor,
                      fontSize: 13),
                )
              ],
            )
          ],
        ),
      );
    }

    return Column(
      children: [
        const Text(
          'Select Challenge Category',
          style: TextStyle(
            fontFamily: 'Inter',
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(12)),
          child: CustomDropdown(dropdownItems: dropdownItems),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                challengeDetailsContainer(
                  challengeTitle: "Running Routine 1",
                  challenge:
                      "Your challenge is to complete a 1KM run in 3 consecutive days",
                  attempted: "25",
                  highestScore: "150",
                ),
                challengeDetailsContainer(
                  challengeTitle: "Daily Walk",
                  challenge:
                      "Your challenge is to complete a 1KM walk throughout a week",
                  attempted: "32",
                  highestScore: "80",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
