import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
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

    // Access the selected value from the state
    int index = _activity.indexWhere((activity) =>
        activity ==
        Provider.of<AuthenticationProvider2>(context).activityLevel);

    int selected = index;

    void onChanged(int value) {
      // Update the selected value in the state
      Provider.of<AuthenticationProvider2>(context, listen: false)
          .updateActivityLevel(_activity[value]);
    }

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
                    child: Consumer<AuthenticationProvider2>(
                        builder: (context, auth, child) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.05, vertical: height * 0.01),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(_activity[index]),
                        ), //Fetch from database
                        subtitle: Text(_description[index]),
                        trailing: SvgPicture.asset(
                          'assets/icons/activity${index + 1}.svg',
                          height: 70,
                          color: selected == index
                              ? Colors.white
                              : const Color.fromARGB(255, 77, 77, 77),
                        ),
                        selected: selected == index ? true : false,
                        onTap: () {
                          auth.updateActivityLevel(_activity[index]);
                          onChanged(index);
                        },
                        selectedTileColor: selected == index
                            ? AppColors.primaryColor
                            : Colors.white,
                        selectedColor: Colors.white,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: selected != index
                                    ? const Color.fromARGB(255, 77, 77, 77)
                                    : AppColors.primaryColor,
                                width: 1)),
                      );
                    }),
                  );
                }),
          )
        ]);
  }
}
