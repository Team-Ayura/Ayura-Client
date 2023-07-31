import 'package:ayura/widgets/features/community/custom_dropdown.dart';
import 'package:ayura/widgets/features/community/header_btn.dart';
import 'package:flutter/material.dart';

//Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() {
    return _LeaderboardViewState();
  }
}

class _LeaderboardViewState extends State<LeaderboardView> {
  String activeComponent =
      'Challenge 1'; // Keeps track of the active UI component

  final List<String> dropdownItems = ['Running', 'Walking', 'Hello'];
  void updateActiveComponent(String component) {
    setState(() {
      activeComponent = component;
    });
  }

  // Leaderbaord winners box
  SizedBox leaderboardWinners(
      String winnerName, String points, MainAxisAlignment alignment) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: alignment,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileIcon.png'),
            radius: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            winnerName,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppColors.textColor,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            points,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppColors.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  //Leaderboard winnersList
  Container otherWinners() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.alternateGreyColor, // Set the border color
          width: 1, // Set the border width
        ),
        borderRadius: BorderRadius.circular(15), // Set the border radius
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileIcon.png'),
            radius: 18,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Ruchira Bogahawatta',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.alternateGreyColor,
              fontSize: 13,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Icon(
            Icons.circle,
            size: 15,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '150',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.alternateGreyColor),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeaderButton(
                buttonName: 'Challenge 1',
                onPressed: () => updateActiveComponent('Challenge 1'),
                isActive: activeComponent == 'Challenge 1',
                buttonType: 'textButton',
              ),
              HeaderButton(
                buttonName: 'Challenge 2',
                onPressed: () => updateActiveComponent('Challenge 2'),
                isActive: activeComponent == 'Challenge 2',
                buttonType: 'textButton',
              ),
              HeaderButton(
                buttonName: 'Challenge 3',
                onPressed: () => updateActiveComponent('Challenge 3'),
                isActive: activeComponent == 'Challenge 3',
                buttonType: 'textButton',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //relevant challenge details
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.53,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Challenge was to complete a 1km run for three consecutive days',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.textColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      leaderboardWinners(
                          'Ruchira Bogahawatta', '178', MainAxisAlignment.end),
                      leaderboardWinners(
                          'Namadee Ken', '253', MainAxisAlignment.start),
                      leaderboardWinners(
                          'Esitha Jayakody', '124', MainAxisAlignment.end),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      otherWinners(),
                      otherWinners(),
                      otherWinners(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
