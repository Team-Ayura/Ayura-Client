import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
            const Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("Week"),
                      ),
                      Center(
                        child: Text("Bi-Week"),
                      ),
                      Center(
                        child: Text("Monthly"),
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