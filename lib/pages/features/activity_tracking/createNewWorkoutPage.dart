import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/activity_tracking/exercise_item.dart';
import 'package:ayura/widgets/features/activity_tracking/multiplechoice.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CreateNewWorkoutPage extends StatefulWidget {
  const CreateNewWorkoutPage({super.key});

  @override
  State<CreateNewWorkoutPage> createState() => _CreateNewWorkoutPageState();
}

class _CreateNewWorkoutPageState extends State<CreateNewWorkoutPage> {
  var panelController = PanelController();
  TextEditingController workoutPlanNameController = TextEditingController();
  List<String> optionLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<Activity> selectedActivities = [
    Activity(activityId: "1",activityName: "Basketball",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "2",activityName: "Cricket",isTimeBased: false, caloriesPerHour: 12),
    Activity(activityId: "3",activityName: "Tennis",isTimeBased: false, caloriesPerHour: 12),
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
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.35;

    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Create new plan',
        isBackBtn: true,
      ),
      body: SlidingUpPanel(
        controller: panelController,
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpen,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  controller: workoutPlanNameController,
                  hintText: 'Morning Routine',
                  label: 'Workout plan name',
                  errorMsg: '',
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Setup repeats',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                MultipleChoiceWidget(labelList: optionLabels, controller: controller,),
                const Text(
                  'Activities',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    color: AppColors.primaryColor,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (Activity activity in selectedActivities)
                              ExerciseItemWidget(activityid: activity.activityId,
                              activityname: activity.activityName,
                              count: 0,
                              sets: 0,),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
          panelController: panelController,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
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
  PanelController panelController;
  bool isOpenPanel = false;
  PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  // final NumberFormat numberFormat = NumberFormat('#,###');
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 10),
        controller: widget.controller,
        children: <Widget>[
          buildDragHandle(),
          const SizedBox(
            height: 10,
          ),
          buildOnRideScreenContent(),
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

  Widget buildOnRideScreenContent() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const SizedBox(
        height: 10,
      ),

    ],
  );
}
