import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/mealPlan/createmeal.dart';
import 'package:ayura/pages/features/mealPlan/viewmeal_screen.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/mealplan/mealsList.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  MealScreenState createState() => MealScreenState();
}

class MealScreenState extends State<MealScreen> {
  final List<String> tabTitles = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

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
              onTap: () {
                PageNavigator(context: context).nextPage(Createmeal());
              },
              child: Container(
                  height: height * 0.17,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 10,
                        left: 12,
                        child: Text(
                          'Wanna Create \nyour own healthy\nmeal ?',
                          style: TextStyle(
                            fontFamily: 'inter',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                          width: 130,
                          right: 12,
                          child: Image.asset(
                            'assets/images/mealPlan/mealImg.png',
                            fit: BoxFit.contain,
                          ))
                    ],
                  )),
            ),
            SizedBox(height: height * 0.02),
            const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 29),
                  child: Text('Meals for you',
                      style: TextStyle(
                        fontFamily: 'inter',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                )),
            SizedBox(height: height * 0.02),
            DefaultTabController(
              initialIndex: 0,
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    indicatorPadding: EdgeInsets.all(2),
                    labelStyle: TextStyle(fontSize: 17),
                    unselectedLabelColor: Colors.grey,
                    //add border color to unselected tabs
                    labelColor: Colors.white,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor,
                    ),

                    tabs: const [
                      Tab(text: 'Breakfast'),
                      Tab(text: 'Lunch'),
                      Tab(text: 'Dinner'),
                      Tab(text: 'Snacks'),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: height * 0.5,
                    child: const TabBarView(
                      children: [
                        MealsList(),
                        MealsList(),
                        MealsList(),
                        MealsList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
