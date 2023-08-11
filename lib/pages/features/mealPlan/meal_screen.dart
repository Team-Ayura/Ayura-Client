import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/mealPlan/createmeal.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/mealplan/mealsList.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Set the preferred size here.
        child: CustomAppBar(
          appbarTitle: 'Meal Plan',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              PageNavigator(context: context).nextPage(const Createmeal());
            },
            child: Container(
              height: height * 0.17,
              // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(69, 158, 158, 158),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  const Text(
                    'Wanna create \nyour own healthy\nmeal ?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/mealPlan/mealImage.png',
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.03),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Meals for you',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              children: [
                TabBar(
                  indicatorPadding: const EdgeInsets.all(2),
                  labelStyle: const TextStyle(fontSize: 17),
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
                SizedBox(
                  //Change the layout from container to sizedbox due to overflow error
                  height: height * 0.45,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: TabBarView(
                      children: [
                        MealsList(),
                        MealsList(),
                        MealsList(),
                        MealsList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
