import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/mood_traking/biweekcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/monthcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/moodpiechart.dart';
import 'package:ayura/widgets/features/mood_traking/weekcalendar.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ayura/widgets/global/tip_chip.dart';
import 'package:provider/provider.dart';

import '../../../constants/styles.dart';
import '../../../provider/moodProviders/selectedmood.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {

    final moodProvider = Provider.of<MoodProvider>(context);
    
    //take habits from provider
    final habits = moodProvider.getHabitsForMood("angry"); 
    final habit1 = habits.isNotEmpty ? habits[0] : null;
    final habit2 = habits.length > 1 ? habits[1] : null;
    final habit3 = habits.length > 2 ? habits[2] : null;
    
    return DefaultTabController(
      //tabbar part
      length: 3, 
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
        child: Column(
          children:[
            ButtonsTabBar(
              height:65 ,
              contentPadding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
              backgroundColor:AppColors.primaryColor,
              borderColor: Colors.transparent,
              unselectedBorderColor: AppColors.disabledColor,borderWidth: 1,
              unselectedBackgroundColor: Colors.white,
              unselectedLabelStyle:const  TextStyle(color: AppColors.disabledColor),
              labelStyle:
                  const TextStyle(color: Colors.white),
              tabs:const [
                Tab(
                  text: "Weekly",
                ),
                Tab(
                  text: "Fortnight",
                ),
                Tab(
                  text: "Monthly",
                ),
              ],  
            ),

            //tab contents
            Expanded(
                  child: TabBarView(
                    children: <Widget>[
                    //week tab
                    SingleChildScrollView(
                      child:Column(
                        children:[
                          const SizedBox(height: 10,),  
                          const WeekCalendar(),
                          const SizedBox(height: 10,),
                          MoodVariationChart(),
                           SizedBox(height: 10.0,),
                           Padding(
                             padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                             child: Row(
                                children: [
                                  Text("Try these things to fix your mental health status.",style: AppStyles.subHeadingTextStyle3,),
                                ],
                              ),
                           ),
                            const SizedBox(height: 10.0,),
                            TipChip(
                              title: habit1 != null ? habit1['title'] : "",
                              description: habit1 != null ? habit1['description'] : "",
                              image: habit1 != null ? habit1['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                            TipChip(
                              title: habit2 != null ? habit2['title'] : "",
                              description: habit2 != null ? habit2['description'] : "",
                              image: habit2 != null ? habit2['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                             TipChip(
                                title: habit3 != null ? habit3['title'] : "",
                                description: habit3 != null ? habit3['description'] : "",
                                image: habit3 != null ? habit3['image'] : "",
                              ),

                        ],
                      ),
                    ),
                    //bi week tab
                    SingleChildScrollView(
                       child:Column(
                        children:[ 
                          const SizedBox(height: 10,),
                          const BiweekCalendar(),
                          const SizedBox(height: 10,),
                          MoodVariationChart(),
                           SizedBox(height: 10.0,),
                           const Row(
                              children: [
                                Text("Try these things to fix your mental health status.",style: AppStyles.subHeadingTextStyle3,),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            TipChip(
                              title: habit1 != null ? habit1['title'] : "",
                              description: habit1 != null ? habit1['description'] : "",
                              image: habit1 != null ? habit1['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                            TipChip(
                              title: habit2 != null ? habit2['title'] : "",
                              description: habit2 != null ? habit2['description'] : "",
                              image: habit2 != null ? habit2['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                             TipChip(
                                title: habit3 != null ? habit3['title'] : "",
                                description: habit3 != null ? habit3['description'] : "",
                                image: habit3 != null ? habit3['image'] : "",
                              ),


                        ],
                      ),
                    ),
                    //Monthly tab
                    SingleChildScrollView(
                      child:Column(
                        children:[ 
                          const SizedBox(height: 10,),
                          const MonthCalendar(),
                          const SizedBox(height: 10,),
                          MoodVariationChart(),
                          SizedBox(height: 10.0,),
                          const Row(
                            children: [
                              Text("Try these things to fix your mental health status.",style: AppStyles.subHeadingTextStyle3,),
                            ],
                          ),
                          const SizedBox(height: 10.0,),
                            TipChip(
                              title: habit1 != null ? habit1['title'] : "",
                              description: habit1 != null ? habit1['description'] : "",
                              image: habit1 != null ? habit1['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                            TipChip(
                              title: habit2 != null ? habit2['title'] : "",
                              description: habit2 != null ? habit2['description'] : "",
                              image: habit2 != null ? habit2['image'] : "",
                            ),
                            SizedBox(height: 10.0,),
                             TipChip(
                                title: habit3 != null ? habit3['title'] : "",
                                description: habit3 != null ? habit3['description'] : "",
                                image: habit3 != null ? habit3['image'] : "",
                              ),
                        ],
                      ),
                    ),
                    
                  ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}