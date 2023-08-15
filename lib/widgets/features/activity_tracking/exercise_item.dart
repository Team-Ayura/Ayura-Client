import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';

class ExerciseItemWidget extends StatelessWidget {
  final String activityid;
  final String activityname;
  final int count;
  final int sets;

  ExerciseItemWidget({required this.activityid, required this.activityname, required this.count, required this.sets});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Slidable(
              key: Key(activityid),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () => print('something'),
                ),
                children: [
                  SlidableAction(
                    icon: Icons.edit,
                    backgroundColor: Colors.green,
                    onPressed: (context) {
                      // Handle edit action
                    },
                  ),
                  SlidableAction(
                    icon: Icons.delete,
                    backgroundColor: Colors.redAccent,
                    onPressed: (context) {
                      // Handle delete action
                    },
                  ),
                ],
              ),
              child: Builder(
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.textColor.withOpacity(0.02), // Replace with your desired box color
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.1), // Replace with your desired color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Lottie.asset(
                            'assets/images/activity_tracking/activities/${activityname.replaceAll(' ', '').toLowerCase()}.json', // Replace with your SVG asset path
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activityname,
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Sets: $sets',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Count: $count',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
