import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/mood_tracking/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MoodButton extends StatefulWidget {
  final String emojiName;
  final String mood;
  const MoodButton({super.key,
    required this.emojiName,
    required this.mood,
  });

  @override
  State<MoodButton> createState() => _MoodButtonState();
}

class _MoodButtonState extends State<MoodButton> {
  bool isSelected = false;
  int selectedCount = 0;

  void _onChipSelected(bool selected) {
    setState(() {
      isSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      
        onPressed: () {
          _onChipSelected(!isSelected);
          selectedCount++;
        },

    
      label: Text(
        widget.mood,
        style: TextStyle(
          color: isSelected? Colors.white : Colors.black,
        ),
      ),
      labelPadding: const EdgeInsets.all(10.0),
      clipBehavior: Clip.antiAlias,
      backgroundColor: isSelected ? AppColors.primaryColor:Colors.white,
      
      shadowColor: AppColors.shadowColor,
      elevation: isSelected ? 1 : 1,
      avatar: SvgPicture.asset(
        'assets/images/mood_tracking/${widget.emojiName}.svg',
          
      ),
      
      
    );
  }
}
