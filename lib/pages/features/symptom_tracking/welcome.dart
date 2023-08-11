import 'package:ayura/pages/features/symptom_tracking/page1.dart';
import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Symptom Tracker'),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.calendar_today),
      //       onPressed: () {
      //         // Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
      //         PageNavigator(context: context).nextPage(Page2());
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
IconButton(onPressed:(){PageNavigator(context: context).nextPage(const Page2());} , icon:Icon(Icons.calendar_month_outlined) ),
            ],),
          
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              'Choose where you had an uncomfortable sensation today',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  PageNavigator(context: context).nextPage(Page1());
                },
                child: Image.asset(
                  'assets/images/symptom_tracking/human.png',
                  width: 210,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}