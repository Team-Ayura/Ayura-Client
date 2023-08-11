import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class MultiSelectChip extends StatefulWidget {
  const MultiSelectChip({required this.challengeCategory, super.key});

  @override
  State<MultiSelectChip> createState() {
    
    return _MultiSelectChipState();
  }

  final String challengeCategory;
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: ChoiceChip(
        label: Text(
          widget.challengeCategory,
          style: TextStyle(
            fontFamily: 'Inter', // Replace with your font family 'Inter'
            color: isSelected
                ? Colors.white
                : AppColors.primaryColor, // Set selected text color to white
          ),
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            isSelected = selected;
          });
        },
        selectedColor: AppColors.primaryColor,
        backgroundColor: const Color.fromRGBO(229, 240, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the border radius as needed
        ),
      ),
    );
  }
}
