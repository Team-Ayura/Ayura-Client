import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/activityProviders/workoutsProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/exercise_item.dart';
import 'package:ayura/widgets/features/activity_tracking/multiplechoice.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CreateNewWorkoutPage extends StatefulWidget {
  const CreateNewWorkoutPage({super.key});

  @override
  State<CreateNewWorkoutPage> createState() => _CreateNewWorkoutPageState();
}

class _CreateNewWorkoutPageState extends State<CreateNewWorkoutPage> {
  var panelController = PanelController();
  // final workoutProvider = Provider.of<WorkoutsProvider>(context);
  TextEditingController workoutPlanNameController = TextEditingController();
  List<String> optionLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Activity> selectedActivities = [
    Activity(activityId: "1",activityName: "T Plank",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "2",activityName: "Push Ups",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "3",activityName: "Reverse Crunches",isTimeBased: false, caloriesPerHour: 12),
  ];
  late MultipleChoiceController controller;
  @override
  void initState() {
    super.initState();
    controller = MultipleChoiceController(optionLabels.length);
  }
  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.7;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0;
    var isPanelOpen = false;
    void openPanel() {
      panelController.open();
      setState(() {
        isPanelOpen = true;
      });
    }

    void closePanel() {
      panelController.close();
      setState(() {
        isPanelOpen = false;
      });
    }


    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Create new plan',
        isBackBtn: true,
        onPressed: openPanel,
        iconName: Icons.add,
      ),
      body: Stack(
        children: [
          SlidingUpPanel(
          controller: panelController,
          minHeight: panelHeightClosed,
          maxHeight: panelHeightOpen,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    controller: workoutPlanNameController,
                    hintText: 'Morning Routine',
                    label: 'Workout plan name',
                    errorMsg: '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //   'Setup repeats',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     fontFamily: 'Inter',
                  //     color: AppColors.primaryColor,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // MultipleChoiceWidget(labelList: optionLabels, controller: controller,),
                  const Text(
                    'Activities',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Consumer<WorkoutsProvider>(
                    builder: (context, workoutsProvider, _) {
                      final activityMap = workoutsProvider.newWorkoutActivities;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (int index = 0; index < activityMap.length; index++)
                                  ExerciseItemWidget(
                                    activityid: activityMap[index].activityId,
                                    activityname: activityMap[index].activityName,
                                    count: activityMap[index].countPerSet,
                                    sets: activityMap[index].numOfSets,
                                    index: index,
                                  ),
                              ],
                            );
                    }
                  ),
                  // Consumer<WorkoutsProvider>(
                  //   builder: (context, workoutsProvider, _) {
                  //     final activityMap = workoutsProvider.newWorkoutActivities;
                  //     return ReorderableListView(
                  //       onReorder: (oldIndex, newIndex) {
                  //         workoutsProvider.reorderWorkoutPlans(oldIndex, newIndex);
                  //         // if (oldIndex != newIndex) {
                  //         //   // Reorder the activityMap based on the drag-and-drop action
                  //         //   final movedActivity = activityMap.removeAt(oldIndex);
                  //         //   activityMap.insert(newIndex, movedActivity);
                  //         // }
                  //       },
                  //       children: [
                  //         for (int index = 0; index < activityMap.length; index++)
                  //           ExerciseItemWidget(
                  //             key: ValueKey(index),
                  //             activityid: activityMap[index].activityId,
                  //             activityname: activityMap[index].activityName,
                  //             count: activityMap[index].countPerSet,
                  //             sets: activityMap[index].numOfSets,
                  //             index: index,
                  //           ),
                  //       ],
                  //     );
                  //   }
                  // ),

                  Consumer<WorkoutsProvider>(
                    builder: (context, workoutsProvider, _) {
                      return GestureDetector(
                        onTap: () {
                          workoutsProvider.addNewWorkoutPlan(workoutPlanNameController.text);
                          Navigator.of(context).pop();
                          },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
          panelBuilder: (controller) => PanelWidget(
            controller: controller,
            panelController: panelController,
          ),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(18),
          ),
        ),
        if(isPanelOpen)
          GestureDetector(
            onTap: closePanel,
            child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            ),
          ),
        ]
      ),
    );
  }
}

class Activity {
  final String activityId;
  final String activityName;
  final bool isTimeBased;
  final double caloriesPerHour;

  Activity({
    required this.activityId,
    required this.activityName,
    required this.isTimeBased,
    required this.caloriesPerHour,
  });
}


class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  final PanelController panelController;
  bool isOpenPanel = false;
  PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  // final NumberFormat numberFormat = NumberFormat('#,###');
  List<Activity> allActivities = [
    Activity(activityId: "1",activityName: "T Plank",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "2",activityName: "Push Ups",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "3",activityName: "Reverse Crunches",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "4",activityName: "Jumping Jacks",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "5",activityName: "Seated Abs Circle",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "6",activityName: "Staggered Push Ups",isTimeBased: false, caloriesPerHour: 12),
  ];
  void searchSports(String query) {
    setState(() {
      // Filter the sports list based on the search query
      // filteredSports = widget.sports
      //     .where(
      //         (sport) => sport.name.toLowerCase().contains(query.toLowerCase()))
      //     .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(top: 10),
        controller: widget.controller,
        children: <Widget>[
          buildDragHandle(),
          const SizedBox(
            height: 10,
          ),
          buildPanelScreenContent(),
          const SizedBox(
            height: 10,
          ),
        ]);
  }

  void togglePanel() {
    if (widget.isOpenPanel) {
      widget.panelController.close();
    } else {
      widget.panelController.open();
    }
    widget.isOpenPanel = !widget.isOpenPanel;
  }

  Widget buildDragHandle() => Center(
    child: GestureDetector(
      onTap: () => togglePanel(),
      child: Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(
            color: AppColors.textColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  // void showPopUp(){
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return WorkoutDialog();
  //     },
  //   );
  // }

  Widget buildPanelScreenContent() => Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: searchSports,
          decoration: InputDecoration(
            hintText: 'Search activities',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: AppColors.textColor.withOpacity(0.075),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent), // Remove the underline
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent), // Remove the underline
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 600,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: allActivities.length,
              itemBuilder: (context, index) {
                final activity = allActivities[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () => addActivity(activity),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                        ),
                        child: ListTile(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WorkoutDialog(activity: activity);
                              },
                            );
                          },
                          leading: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.textColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Lottie.asset(
                              'assets/images/activity_tracking/activities/${activity.activityName.replaceAll(' ', '').toLowerCase()}.json',
                              width: 40,
                              height: 40,
                              // color:
                              //     sport.isSelected ? Colors.white : null,
                            ),
                          ),
                          title: Text(
                            activity.activityName,
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.textColor.withOpacity(0.3),
                      height: 1,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    ),
  );

  addActivity(Activity activity) {
    // do nothing
  }
}

class WorkoutDialog extends StatefulWidget {
  final Activity activity;
  const WorkoutDialog({Key? key, required this.activity}) : super(key: key);
  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  late TextEditingController _countController;
  late TextEditingController _setsController;

  @override
  void initState() {
    super.initState();
    _countController = TextEditingController();
    _setsController = TextEditingController();
  }

  @override
  void dispose() {
    _countController.dispose();
    _setsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set Workout'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _countController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Count Per Set'),
          ),
          TextField(
            controller: _setsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Number of Sets'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {

            final workoutProvider = Provider.of<WorkoutsProvider>(context, listen: false,);
            int countPerSet = int.tryParse(_countController.text) ?? 0;
            int numOfSets = int.tryParse(_setsController.text) ?? 0;
            workoutProvider.addActivityToNewWorkout(widget.activity, countPerSet, numOfSets);
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
