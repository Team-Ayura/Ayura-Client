import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SleepQualityOption {
  final String title;
  final String description;
  final String image;

  SleepQualityOption(this.title, this.description,this.image);
}

List<SleepQualityOption> sleepQualityOptions = [
  SleepQualityOption("Great :  Rested and Refreshed", "Quality rest leaves you refreshed and energized",'assets/images/sleep_tracking/Great.svg'),
  SleepQualityOption("Good :  Peaceful Rest", "A solid rest leaves you fairly refreshed and ready for the day.",'assets/images/sleep_tracking/Good.svg'),
  SleepQualityOption("Okay : Mixed Rest", "Leaves you somewhat refreshed, with room to enhance.",'assets/images/sleep_tracking/Okay.svg'),
  SleepQualityOption("Not Great :  Restless Sleep", "Disruptions led to a restless experience.",'assets/images/sleep_tracking/Not_Great.svg'),
  SleepQualityOption("Horrible:  Unsettled Sleep", "Significant disruptions left you tired and fatigued.",'assets/images/sleep_tracking/Horrible.svg'),
];

class SleepQualitySelection extends StatefulWidget {
  const SleepQualitySelection({super.key});

  @override
  SleepQualitySelectionState createState() => SleepQualitySelectionState();
}

class SleepQualitySelectionState extends State<SleepQualitySelection> {
  int selectedTileIndex = -1;

  void selectTile(int index) {
    setState(() {
      selectedTileIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sleepQualityOptions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
        itemBuilder: (context, index) {
          SleepQualityOption option = sleepQualityOptions[index];
          bool isSelected = index == selectedTileIndex;
      
          return GestureDetector(
            onTap: () {
              selectTile(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                border: isSelected ? Border.all(color: AppColors.primaryColor,style: BorderStyle.solid) :Border.all(color: Colors.black,style: BorderStyle.solid),
              ),
              child: ListTile(
                contentPadding:const EdgeInsets.fromLTRB(8, 5, 4, 5),
                leading: SvgPicture.asset(
                  option.image, //image of emoji
                ),
                title: Text(
                  option.title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                subtitle: Text(
                  option.description,
                   style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.disabledColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
