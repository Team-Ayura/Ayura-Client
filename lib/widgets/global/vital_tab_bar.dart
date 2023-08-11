import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/pages/features/symptom_tracking/welcome.dart';
import 'package:ayura/widgets/features/mood_traking/biweekcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/monthcalendar.dart';
import 'package:ayura/widgets/features/mood_traking/moodpiechart.dart';
import 'package:ayura/widgets/features/mood_traking/weekcalendar.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ayura/widgets/global/tip_chip.dart';
import 'package:provider/provider.dart';

import '../../../provider/moodProviders/selectedmood.dart';

class VitalsTabBarView extends StatelessWidget {
  const VitalsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {

 
    
    return DefaultTabController(
      //tabbar part
      length: 2, 
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
                  text: "Symptom Tracker",
                ),
                Tab(
                  text: "Mood Tracker",
                ),
              ],  
            ),

            //tab contents
            const Expanded(
                  child: TabBarView(
                    children: <Widget>[

                      //symptom tab
                      WelcomePage(),
                      //mood tab
                      SelectMood()
                    
                    
                  ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}