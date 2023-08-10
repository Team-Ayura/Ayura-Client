import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/activity_tracking/multiplechoice.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:flutter/material.dart';

class CreateNewWorkoutPage extends StatefulWidget {
  const CreateNewWorkoutPage({super.key});

  @override
  State<CreateNewWorkoutPage> createState() => _CreateNewWorkoutPageState();
}

class _CreateNewWorkoutPageState extends State<CreateNewWorkoutPage> {
  TextEditingController workoutPlanNameController = TextEditingController();
  List<String> optionLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  late MultipleChoiceController controller;
  @override
  void initState() {
    super.initState();
    controller = MultipleChoiceController(optionLabels.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'Create new plan',
        isBackBtn: true,
      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
