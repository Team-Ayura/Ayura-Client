import 'package:flutter/material.dart';
import 'package:ayura/pages/features/mood_tracking/page3.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop(), rightCallback :()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ThirdPage()))),
      // appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop()),
      body: const Center(
        child: Text('Be happy ,take deep breathe!'),
      ),
    );
  }
}