import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/symptom_tracking/page3.dart';
import 'package:flutter/material.dart';

import '../../../utils/router.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<CustomListItem> customList = [
    CustomListItem('Headache'),
    CustomListItem('Fatigue'),
    CustomListItem('Nausea'),
    CustomListItem('Dizziness'),
    CustomListItem('Abdominal Pain'),
    CustomListItem('Chest Pain'),
  ];

  List<int> selectedButtonIndexes = List.generate(8, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Head'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              PageNavigator(context: context).nextPage(Page2());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 20.0),
            child: Text(
              'What did you feel?',
              style: TextStyle(fontSize: 24.0),
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
          Center(
            child: ElevatedButton(
              onPressed: () {
                PageNavigator(context: context).nextPage(Page3());
              },
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListItem {
  final String title;

  CustomListItem(this.title);
}