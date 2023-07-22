import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  MealScreenState createState() => MealScreenState();
}

class MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Meal Plan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.2,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wanna Create your own healthy meal ?'),
                Image.asset('assets/images/meal.png')

              ],
            )

          ),
          DefaultTabController(length: 4, child: TabBar(
           
            tabs: [
              Tab(text: 'Breakfast'),
              Tab(text: 'Lunch'),
              Tab(text: 'Dinner'),
              Tab(text: 'Snacks'),
            ],
          )),
        ],
      )
    );
  }
}
