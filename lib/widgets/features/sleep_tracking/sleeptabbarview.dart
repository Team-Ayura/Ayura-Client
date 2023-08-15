import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/sleep_tracking/averagesleeptimecard.dart';
import 'package:ayura/widgets/features/sleep_tracking/biweeklytab.dart';
import 'package:ayura/widgets/features/sleep_tracking/monthlytab.dart';
import 'package:ayura/widgets/features/sleep_tracking/sleepqualitypiechart.dart';
import 'package:ayura/widgets/features/sleep_tracking/weeklytab.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class SleepTabBarView extends StatelessWidget {
  const SleepTabBarView({super.key});

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
                  text: "Bi Weekly",
                ),
                Tab(
                  text: "Monthly",
                ),
              ],  
            ),

            //tab contents
            const Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      WeeklyTab(),
                      BiWeeklyTab(),
                      MonthlyTab(),
            
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}