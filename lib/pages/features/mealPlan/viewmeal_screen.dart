import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/mealplan/nutritions.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ViewmealScreen extends StatelessWidget {
  const ViewmealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final List<String> ingredients = [
      'Rice',
      'Beans',
      'Dhal',
      'Chicken',
      'Onion',
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
              width: 100,
              child: Image.asset(
                'assets/images/mealPlan/riceandcurry.png',
                width: 30,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: height * 0.02),
                const Text(
                  'Nutritional Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                                const Text('2 cups'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.03),
                const Text(
                  'Instructions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  "To make rice curry, start by washing and cooking 1 cup of rice until it's fluffy; set it aside. In a pot, heat 2 tablespoons of oil and add 1 teaspoon of cumin seeds, letting them splutter. Sauté 1 chopped onion until it turns golden, then add 2 cloves of minced garlic and 1-inch of minced ginger, and sauté for another minute. Mix in 2 chopped tomatoes, 1 teaspoon of turmeric, 1 teaspoon of ground coriander, 1 teaspoon of ground cumin, 1/2 teaspoon of red chili powder, and salt to taste. Add 1 cup of mixed vegetables, cover, and cook until they're tender. Combine the cooked vegetables with the rice, gently mixing them together. Sprinkle 1/2 teaspoon of garam masala and mix gently. Garnish the dish with fresh cilantro leaves, and serve the rice curry hot with yogurt or pickle. Feel free to adjust the spices and vegetables according to your preferences.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
