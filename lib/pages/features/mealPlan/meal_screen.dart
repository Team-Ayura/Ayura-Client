import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/mealplan/mealsList.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  MealScreenState createState() => MealScreenState();
}

class MealScreenState extends State<MealScreen> {
  final List<String> tabTitles = ['Mains', 'Sides', 'Snacks'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: CustomAppBar(
          Icons.arrow_back,
          Icons.more_vert,
          'Meals For You',
          leftCallback: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        child: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorPadding: const EdgeInsets.all(2),
                labelStyle: const TextStyle(fontSize: 17),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor,
                ),
                tabs: const [
                  Tab(text: 'Mains'),
                  Tab(text: 'Sides'),
                  Tab(text: 'Snacks'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TabBarView(
                    children: [MealsList(), MealsList(), MealsList()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
