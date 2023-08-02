import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/mood_traking/biweekcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/monthcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/weekcalendar.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    
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
                  text: "Bi-Weekly",
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
                          WeekCalendar(),
                          const SizedBox(height: 10,),
                          // MoodVariationChart(),

                        ],
                      ),
                    ),
                    //bi week tab
                    SingleChildScrollView(
                       child:Column(
                        children:[ 
                          const SizedBox(height: 10,),
                          BiweekCalendar(),
                          const SizedBox(height: 10,),
                          // MoodVariationChart(),

                        ],
                      ),
                    ),
                    //Monthly tab
                    SingleChildScrollView(
                      child:Column(
                        children:[ 
                          const SizedBox(height: 10,),
                          MonthCalendar(),
                          const SizedBox(height: 10,),
                          // MoodVariationChart(),

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