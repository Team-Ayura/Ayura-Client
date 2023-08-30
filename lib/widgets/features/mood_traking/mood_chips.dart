import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../provider/moodProviders/selectedmood.dart';

class MoodButton extends StatelessWidget {
  final String emojiName;
  final String mood;

  const MoodButton({
    Key? key,
    required this.emojiName,
    required this.mood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);
    bool isSelected = moodProvider.selectedMood == mood;

    return ActionChip(
      onPressed: () {
        moodProvider.selectMood(mood);
      },
      label: Text(
        mood,
        style: TextStyle(
          fontFamily: "Inter",
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      visualDensity: const VisualDensity(horizontal: 4.0, vertical: 2.0),
      labelPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      clipBehavior: Clip.antiAlias,
      backgroundColor: isSelected ? AppColors.primaryColor : Colors.white,
      shadowColor: AppColors.shadowColor,
      elevation: isSelected ? 1 : 1,
      avatar: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: SvgPicture.asset(
          'assets/images/mood_tracking/$emojiName.svg',
          width: 30.0,
          height: 30.0,
        ),
      ),
    );
  }
}
