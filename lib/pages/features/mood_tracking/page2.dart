import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/tip_chip.dart';
import 'package:flutter/material.dart';
import 'package:ayura/pages/features/mood_tracking/page3.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop(), rightCallback :()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ThirdPage()))),
      // appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop()),
      body:  SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Column(  
              children:[
                const SizedBox(height: 100.0,),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3rd August 2023",style: TextStyle(color: AppColors.disabledColor),),
                      Text("10.30 PM",style: TextStyle(color: AppColors.disabledColor),),
                    ],
                  ),
                ),
                const Text(
                  "Are you feeling Sad?",
                  style:AppStyles.headingTextStyle,
                ),
                 Center(
                   child: SvgPicture.asset(
                  'assets/images/mood_tracking/pg2img.svg',
                    width: 350,
                    height: 350,
                ),
              ),
              Text("You have been feeling bad in the past few days. Try these habits to calm your mind.",style: AppStyles.subheadingTextStyle2,),
              SizedBox(height: 20.0,),
              TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              SizedBox(height: 5.0,),
              TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              SizedBox(height: 5.0,),
              TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              ],
            ),
          ),
      ),
    );
  }
}