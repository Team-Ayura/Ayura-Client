
import 'package:ayura/pages/features/sleep_tracking/page2.dart';
import 'package:ayura/widgets/features/sleep_tracking/sleepqualityfactors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/styles.dart';
import '../../../utils/router.dart';
import '../../../widgets/features/sleep_tracking/circletimepicker.dart';
import '../../../widgets/features/sleep_tracking/sleepquality.dart';
import '../../../widgets/global/custom_app_bar.dart';
import '../../../widgets/global/custom_button.dart';
import '../../../widgets/global/bottom_navigation.dart';

class SleepFirstPage extends StatelessWidget {
  const SleepFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    
    return Scaffold(
      appBar:CustomAppBar(Icons.arrow_back_outlined,
          Icons.bar_chart_outlined, "Sleep Tracker",
          leftCallback: () => Navigator.of(context).pop(),
          rightCallback: ()=>PageNavigator(context: context).nextPage(const SleepHistory())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            const Wrap(
              children: [
                Text(
                  "How many hours did you sleep?",
                  style:AppStyles.headingTextStyle,
                ),
              ],
            ),

            const SizedBox(height: 20.0,),
            const SetAlarm(),

            const SizedBox(height: 20.0,),
            const Row(
              children: [
                Text(
                  "How was your sleep?",
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20.0,),
            SleepQualitySelection(),
             const Row(
              children: [
                Text(
                  "What affected your sleep?",
                  style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20.0,),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:SleepQualityFactorSelection(),
            ),
           const SizedBox(height: 20.0,),
           Center(
              child: customButton(
                  tap: () {
                    PageNavigator(context: context).nextPage( const SleepHistory());
                  },
                  icon: Icons.arrow_forward,
                  text: 'Continue',
                  width: 200,
                  height: 60,
                  context: context),
          ),

          const SizedBox(height: 20.0,),
          
         ],
        ),
      ),
      bottomNavigationBar: AppNavigation(),
    );
  }
}