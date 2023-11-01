import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LifeStyleOption {
  final String title;
  final String description;
  final String image;

  LifeStyleOption(this.title, this.description,this.image);
}
 
List<LifeStyleOption> LifeStyleOptions = [
  LifeStyleOption("Sedentary", "Little to no activity",'assets/icons/activity1.svg'),
  LifeStyleOption("Lightly Active", "Regular walks, light exercises, or low-intensity workouts",'assets/icons/activity2.svg'),
  LifeStyleOption("Moderately Active", "Moderate exercise or sports 3-5 days a week",'assets/icons/activity3.svg'),
  LifeStyleOption("Very Active", "Engaged in physically demanding occupations",'assets/icons/activity4.svg'),
  LifeStyleOption("Extremely Active", "Regular High Intensity Workouts, Athletics and Sports",'assets/icons/activity5.svg'),
];

class LifeStyleSelection extends StatefulWidget {
  const LifeStyleSelection({super.key});

  @override
  LifeStyleSelectionState createState() => LifeStyleSelectionState();
}

class LifeStyleSelectionState extends State<LifeStyleSelection> {
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
        itemCount: LifeStyleOptions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
        itemBuilder: (context, index) {
          LifeStyleOption option = LifeStyleOptions[index];
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
