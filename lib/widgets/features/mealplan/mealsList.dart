import 'package:ayura/pages/features/mealPlan/viewmeal_screen.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

class MealsList extends StatelessWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('clicked');
              PageNavigator(context: context).nextPage(const ViewmealScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mealPlan/rice.png',
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('100 Cal'),
                        SizedBox(width: 50),
                        Text('40 min')
                      ])
                ],
              ),
            ),
          );
        });
  }
}
