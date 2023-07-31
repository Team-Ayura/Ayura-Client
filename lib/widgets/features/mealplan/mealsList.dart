import 'package:flutter/material.dart';

class MealsList extends StatelessWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0)
                  ]),
              child: Column(
                children: [
                  Image.asset('assets/images/mealPlan/rice.png'),
                  const SizedBox(height: 5),
                  Row(children: const [
                    Text('100 Cal'),
                    SizedBox(width: 10),
                    Text('40 min')
                  ])
                ],
              ));
        });
  }
}
