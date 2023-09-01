import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/createNewWorkoutPage.dart';
import 'package:ayura/provider/activityProviders/sportsProvider.dart';
import 'package:ayura/provider/activityProviders/workoutsProvider.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/activity_tracking/multi_selection_popup.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WorkoutsPage extends StatefulWidget {
  WorkoutsPage({Key? key}) : super(key: key);
  List<WorkoutPlan> workoutplans = [];
  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  // int activeIndex = 0; // -1 means no active index

  @override
  Widget build(BuildContext context) {
    // final NumberFormat numberFormat = NumberFormat('#,###');
    final workoutsProvider = Provider.of<WorkoutsProvider>(context);
    widget.workoutplans = workoutsProvider.currentWorkoutPlans;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        const Size.fromHeight(90.0),
        child: CustomAppBar(
          appbarTitle: 'Workouts',
          iconName: Icons.add,
          isBackBtn: true,
          onPressed: _addNewWorkoutPlan,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<SportsProvider>(builder: (context, sportsProvider, _) {
          widget.workoutplans = workoutsProvider.currentWorkoutPlans;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of Sports Boxes
              if (widget.workoutplans.isNotEmpty)
                for (int index = 0; index < widget.workoutplans.length; index++)
                  Slidable(
                    key: Key(widget.workoutplans[index].workoutPlanName),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () =>
                            workoutsProvider.removeWorkoutPlanAtIndex(index)
                            // sportsProvider.removeSportFromWorkspace(widget
                            //     .workoutplans[index]
                            //     .id), // move the sport to allsports
                      ),
                      children: [
                        SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Colors.redAccent,
                            onPressed: (context) => {
                              workoutsProvider.removeWorkoutPlanAtIndex(index)
                                })
                      ],
                    ),
                    child: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          // navigate to the selected workout startnow page
                        },
                        child: Container(
                          // margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors
                                .backgroundColor, // Set your desired box color here
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.textColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/activity_tracking/workoutitem.svg',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.workoutplans[index].workoutPlanName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                              // Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
              // If sports list is empty, show the information text
              if (widget.workoutplans.isEmpty)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/activity_tracking/workouts_placeholder.svg',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 60, right: 60, top: 10, bottom: 20),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'You currently do not have any workout plans. Use the add ',
                                style: TextStyle(
                                  color: AppColors.textColor.withOpacity(0.4),
                                ),
                              ),
                              const TextSpan(
                                text: '"+"', // The "+" symbol
                                style: TextStyle(
                                  color: AppColors
                                      .textColor, // Change the color of "+" here
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' button to create a workout plan for you.',
                                style: TextStyle(
                                  color: AppColors.textColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // About section
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Workouts',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey
                            .shade200, // Set your desired button color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Start your fitness journey with our app\'s variety of workouts. Improve health, gain strength, and feel better by joining now!',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor.withOpacity(0.4)),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  void showPopUp(BuildContext context, List<Sport> sports) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUp(
          sports: sports,
        );
      },
    );
  }

  void _addNewWorkoutPlan() {
    PageNavigator(context: context).nextPage(const CreateNewWorkoutPage());
  }
}
