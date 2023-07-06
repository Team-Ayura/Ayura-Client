import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  int _selected = 0;
  void _onChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  final List _activity = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremely Active'
  ];
  final List _description = [
    'Little to no activity',
    'Regular walks, light exercises, or low-intensity workouts.',
    'Moderate exercise or sports 3-5 days a week',
    'Engaged in physically demanding occupations.',
    'Regular High Intensity Workouts, Athletics and Sports',
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "How active are you",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),
          SizedBox(height: height * 0.02),
          const Text(
            "Activity level can be depended on how much \n you sit around, exercise and move. ",
            textAlign: TextAlign.center,
            style: AppStyles.bodyTextStyle2,
          ),
          SizedBox(height: height * 0.05),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.025),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.01),
                      title: Text(_activity[index]), //Fetch from database
                      subtitle: Text(_description[index]),
                      trailing: SvgPicture.asset(
                        'assets/icons/activity${index + 1}.svg',
                        height: 60,
                        color: _selected == index ? Colors.white : Colors.black,
                      ),
                      selected: _selected == index ? true : false,
                      onTap: () {
                        _onChanged(index);
                      },
                      selectedTileColor: _selected == index
                          ? AppColors.primaryColor
                          : Colors.white,
                      selectedColor: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              color: _selected != index
                                  ? Colors.black
                                  : AppColors.primaryColor,
                              width: 1)),
                    ),
                  );
                }),
          )
        ]);
  }
}
