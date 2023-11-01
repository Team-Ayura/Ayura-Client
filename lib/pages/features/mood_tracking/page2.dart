import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/vitals/vitals.dart';
import 'package:ayura/utils/router.dart';
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
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context);
    DateTime? selectedDateTime = DateTime.now();  
    //take habits from provider
    final habits = moodProvider.getHabitsForMood(moodProvider.selectedMood.toLowerCase()); 
    final habit1 = habits.isNotEmpty ? habits[0] : null;
    final habit2 = habits.length > 1 ? habits[1] : null;
    final habit3 = habits.length > 2 ? habits[2] : null;
   
    String formattedDate = DateFormat('d , MMMM').format(selectedDateTime!);  // Format the date in "12th July" format
    String formattedTime = DateFormat.jm().format(selectedDateTime);   // Format the time in "10.40PM" format
    
    return Scaffold(
      
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop(), rightCallback :()=>Navigator.push(context,MaterialPageRoute(builder: (context) => const ThirdPage()))),
      body:  SingleChildScrollView(
        child:Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Column(  
              children:[
                const HR_Calendar(),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formattedDate,style: const TextStyle(color:AppColors.disabledColor),),
                    Text(formattedTime,style: const TextStyle(color: AppColors.disabledColor),),
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
                  const SizedBox(width: 100.0,),
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
                            title: const Text("Confirm Delete"),
                            content: const Text("Are you sure you want to delete this entry?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Perform delete action here
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(""),
                                        content: const Text("Successfully deleted."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              PageNavigator(context: context).nextPage(const Vitals()); // Close the dialog
                                            },
                                            child: const Text("OK"),
                                          ),
                                          
                                        ],
                                      );
                                    },
                                  );// Close the dialog
                                },
                                child: const Text("Delete"),
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
              Text("You have been feeling ${moodProvider.selectedMood.toLowerCase()} . Try these habits to relax and refresh your mind.",style: AppStyles.subHeadingTextStyle3),
              const SizedBox(height: 20.0,),
             
             TipChip(
                title: habit1 != null ? habit1['title'] : "",
                description: habit1 != null ? habit1['description'] : "",
                image: habit1 != null ? habit1['image'] : "",
              ),
              const SizedBox(height: 5.0,),
              TipChip(
                title: habit2 != null ? "${habit2['title']}" : "",
                description: habit2 != null ? "${habit2['description']}" : "",
                image: habit2 != null ? "${habit2['image']}" : "",
              ),
              const SizedBox(height: 5.0,),
              TipChip(
                title: habit3 != null ? "${habit3['title']}" : "",
                description: habit3 != null ? "${habit3['description']}" : "",
                image: habit3 != null ? "${habit3['image']}" : "",
              ),
              // const SizedBox(height: 5.0,),
              // const TipChip(title: "Calm your mind with Yoga", description: "5 min", image: "assets/images/mood_tracking/sport1.png"),
                
    
              ],
            ),
          ),
    ),
    );
  }
}