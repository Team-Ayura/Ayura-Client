import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/features/mealplan/mealsList.dart';
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
          leading: const Icon(Icons.arrow_back),
          title: const Text('Meal Plan'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.03),
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: height * 0.17,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 10,
                        left: 15,
                        child: Text(
                          'Wanna Create your own \nhealthy meal ?',
                          style: TextStyle(
                            fontFamily: 'inter',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 10,
                          child:
                              Image.asset('assets/images/mealPlan/mealImg.png'))
                    ],
                  )),
            ),
            SizedBox(height: height * 0.01),
            DefaultTabController(
              initialIndex: 0,
                length: 4,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  //add border color to unselected tabs
                  labelColor: Colors.white,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryColor,
                  ),

                  tabs: const [
                    Tab(text: 'Breakfast'),
                    Tab(text: 'Lunch'),
                    Tab(text: 'Dinner'),
                    Tab(text: 'Snacks'),
                  ],
                )),
            SizedBox(height: height * 0.01),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for the 'Breakfast' tab
                  Icon(Icons.directions_car),

                  // Content for the 'Lunch' tab
                  Icon(Icons.directions_transit),

                  // Content for the 'Dinner' tab
                  Icon(Icons.directions_bike),

                  // Content for the 'Snacks' tab
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ));
  }
}
