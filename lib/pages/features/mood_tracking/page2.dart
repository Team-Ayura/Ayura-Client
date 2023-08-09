import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/tip_chip.dart';
import 'package:flutter/material.dart';
import 'package:ayura/pages/features/mood_tracking/page3.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../provider/moodProviders/selectedmood.dart';
import '../../../widgets/features/mood_traking/hr_calendar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);
    DateTime? selectedDateTime = moodProvider.selectedDateTime;   
    String formattedDate = DateFormat('d , MMMM').format(selectedDateTime!);  // Format the date in "12th July" format
    String formattedTime = DateFormat.jm().format(selectedDateTime);   // Format the time in "10.40PM" format
    
    return Scaffold(
      
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop(), rightCallback :()=>Navigator.push(context,MaterialPageRoute(builder: (context) => ThirdPage()))),
      body:  SingleChildScrollView(
        child:Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Column(  
              children:[
                HR_Calendar(),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${formattedDate}",style: TextStyle(color:AppColors.disabledColor),),
                    Text("${formattedTime}",style: TextStyle(color: AppColors.disabledColor),),
                  ],
                ),
               Row(
                 children: [
                  Flexible(
                    child: Text(
                      "Are you feeling ${moodProvider.selectedMood.toLowerCase()}?",
                      style: AppStyles.subheadingTextStyle2,
                    ),
                  ),
                  SizedBox(width: 100.0,),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.edit),
                    alignment: Alignment.centerRight,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Delete"),
                            content: Text("Are you sure you want to delete this entry?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Perform delete action here
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(""),
                                        content: Text("Successfully deleted."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close the dialog
                                            },
                                            child: Text("OK"),
                                          ),
                                          
                                        ],
                                      );
                                    },
                                  );// Close the dialog
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.delete_outlined),
                    alignment: Alignment.centerRight,
                  ),
                    
                 ],
               ),

                 Center(
                   child: SvgPicture.asset(
                  'assets/images/mood_tracking/pg2img.svg',
                    width: 350,
                    height: 350,
                ),
              ),
              const Text("You have been feeling bad in the past few days. Try these habits to calm your mind.",style: AppStyles.subHeadingTextStyle3),
              const SizedBox(height: 20.0,),
              const TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              const SizedBox(height: 5.0,),
              const TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              const SizedBox(height: 5.0,),
              const TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
              ],
            ),
          ),
    ),
    );
  }
}