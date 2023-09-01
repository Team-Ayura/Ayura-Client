import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

class SleepQualityFactorSelection extends StatefulWidget {
  const SleepQualityFactorSelection({super.key});

  @override
  SleepQualityFactorSelectionState createState() => SleepQualityFactorSelectionState();
}

class SleepQualityFactorSelectionState extends State<SleepQualityFactorSelection> {
  List<String> beforeSleepQualityFactors = [
    "Stress",
    "Shower or Bath",
    "Meditation",
    "Breating Exercise",
    "Busy Schedule",
    "Reading",
    "Screen Time",
    "Alchol",
    "Work",
    "Travel",
    "Pain"
    // Add more factors as needed
  ];

  List<String> afterSleepQualityFactors = [
    "Dream",
    "Cool Room Temperature",
    "Warm Room Temperature",
    "Interupted  Sleep",
    "Fell Asleep Quickly",
    "Restful Sleep",
    "Restless Sleep",
    "Woke Up Refreshed",
    "Woke Up Early",
    "Woke Up Late",
    "Nightmare",
    // Add more factors as needed
  ];

  List<String> selectedBeforeFactors = [];
  List<String> selectedAfterFactors = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          //before sleep part
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              children: [
                Icon(Icons.light_mode),
                SizedBox(width: 10,),
                Text(
                  "Before Sleep",
                  style: AppStyles.subheadingTextStyle2,
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: beforeSleepQualityFactors.map((factor) {
              bool isSelected = selectedBeforeFactors.contains(factor);
    
              return ChoiceChip(
                label: Text(factor),
                selected: isSelected,
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedBeforeFactors.add(factor);
                    } else {
                      selectedBeforeFactors.remove(factor);
                    }
                  });
                },
                selectedColor: AppColors.primaryColor,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                backgroundColor: isSelected ?AppColors.primaryColor.withOpacity(0.2) : Colors.white,
                shape: RoundedRectangleBorder(
                   side: BorderSide(
                  color: isSelected ? AppColors.primaryColor.withOpacity(0.2) : AppColors.disabledColor,
                  width: 1.0, // Adjust the width as needed
                ),
                borderRadius: BorderRadius.circular(10.0),
                ),
                labelPadding: const EdgeInsets.all(3.0),
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              children: [
                Icon(Icons.bed),
                SizedBox(width: 10,),
                Text(
                  "After Sleep",
                  style:AppStyles.subheadingTextStyle2
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8.0,
            children: afterSleepQualityFactors.map((factor) {
              bool isSelected = selectedAfterFactors.contains(factor);
    
              return ChoiceChip(
                label: Text(factor),
                selected: isSelected,
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedAfterFactors.add(factor);
                    } else {
                      selectedAfterFactors.remove(factor);
                    }
                  });
                },
                selectedColor: AppColors.primaryColor,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                backgroundColor: isSelected ? AppColors.primaryColor.withOpacity(0.2) : Colors.white,
                 shape: RoundedRectangleBorder(
                   side: BorderSide(
                  color: isSelected ? AppColors.primaryColor.withOpacity(0.2) : AppColors.disabledColor,
                  width: 1.0, // Adjust the width as needed
                ),
                borderRadius: BorderRadius.circular(10.0),
                ),
                labelPadding: const EdgeInsets.all(3.0),
              );
            }).toList(),
          ),
          
        ],
      ),
    );
  }
}
