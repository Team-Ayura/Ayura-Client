import 'package:ayura/pages/features/symptom_tracking/chesttips.dart';
import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/vitals/vitals.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/constants/styles.dart';

import '../../../utils/router.dart';
import '../../../widgets/global/custom_button.dart';

class Chest extends StatefulWidget {
  const Chest({super.key});

  @override
  ChestState createState() => ChestState();
}

class ChestState extends State<Chest> {
  List<CustomListItem> customList = [
    CustomListItem('Chest Pain'),
    CustomListItem('Shortness of Breath'),
    CustomListItem('Chest Tightness'),
    CustomListItem('Heartburn'),
    CustomListItem('Fatigue'),
    CustomListItem('Rapid Breathing'),
    CustomListItem('Abnormal Heart Sounds'),
  ];

  List<int> selectedButtonIndexes = List.generate(8, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icons.arrow_back_outlined,
          Icons.calendar_month_outlined,
          "Chest",
          leftCallback :()=>Navigator.of(context).pop(),
          rightCallback :()=>PageNavigator(context: context).nextPage(const Page2())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 20.0),
            child: Text(
              'What did you feel?',
              style: AppStyles.headingTextStyle,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: customList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedButtonIndexes[index] = -1;
                                  });
                                },
                                child: ListTile(
                                  leading: const Icon(Icons.sentiment_satisfied),
                                  title: Text(customList[index].title),
                                  trailing: Checkbox(
                                    value: selectedButtonIndexes[index] != -1,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedButtonIndexes[index] = value == true ? 0 : -1;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              if (selectedButtonIndexes[index] != -1)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedButtonIndexes[index] = 1;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: selectedButtonIndexes[index] == 1
                                            ? Colors.green
                                            : Colors.white,
                                        onPrimary: selectedButtonIndexes[index] == 1 ? Colors.white : Colors.grey,
                                      ),
                                      child: const Text('Light, It did not interrupt my daily routine'),
                                    ),
                                    const SizedBox(width: 16.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedButtonIndexes[index] = 2;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: selectedButtonIndexes[index] == 2
                                            ? Colors.orange
                                            : Colors.white,
                                        onPrimary: selectedButtonIndexes[index] == 2 ? Colors.white : Colors.grey,
                                      ),
                                      child: const Text('Moderate, It was hard but manageable'),
                                    ),
                                    const SizedBox(width: 16.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedButtonIndexes[index] = 3;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: selectedButtonIndexes[index] == 3
                                            ? Colors.red
                                            : Colors.white,
                                        onPrimary: selectedButtonIndexes[index] == 3 ? Colors.white : Colors.grey,
                                      ),
                                      child: const Text('Unbearable, I could not even stand straight'),
                                    ),
                                    const SizedBox(width: 16.0),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton(
                  tap: () {
                    PageNavigator(context: context).nextPage(const Vitals());
                  },
                  text: 'More Areas',
                  width: 120,
                  height: 60,
                  context: context
              ),
              const SizedBox(width: 50),
              customButton(
                  tap: () {
                    PageNavigator(context: context).nextPage(const ChestTips());
                  },
                  text: 'Done',
                  width: 120,
                  height: 60,
                  context: context
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomListItem {
  final String title;

  CustomListItem(this.title);
}