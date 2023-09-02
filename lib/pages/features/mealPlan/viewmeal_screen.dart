import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/mealplan/nutritions.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ViewmealScreen extends StatelessWidget {
  const ViewmealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final List<String> ingredients = [
      'Rice',
      'Green Gram',
      'Big Onion',
      'Salt',
      'Dried chilli',
      'Lime juice',      
      // Add more items as needed.
    ];
    return Scaffold(
      appBar: CustomAppBar(Icons.arrow_back, Icons.more_vert, 'Meal Plan',
          leftCallback: () => Navigator.pop(context)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.35,
              width: 90,
              child: Image.asset(
                'assets/images/mealPlan/greengramrice.png',
                width: 30,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nutritional Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '213kcal\n/per serving',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                nutritions(context),
                SizedBox(height: height * 0.03),
                const Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      String ingredientImage =
                          'assets/images/mealPlan/ingredient${index + 1}.png';
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SizedBox(
                          width: 100, // Adjust the width as needed
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                ClipOval(
                                  child: Image.asset(
                                    ingredientImage,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(ingredients[index]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.03),
              
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
