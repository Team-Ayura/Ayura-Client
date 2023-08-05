import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/activityProviders/sportsProvider.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddTimePopUp extends StatefulWidget {
  final String sportid;

  AddTimePopUp({required this.sportid});

  @override
  _AddTimePopUpState createState() => _AddTimePopUpState();
}

class _AddTimePopUpState extends State<AddTimePopUp> {
  @override
  void initState() {
    super.initState();
  }

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay finishTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "${startTime.hour}:${startTime.minute} ${startTime.period}"),
                  GestureDetector(
                    onTap: () {
                      setState(() async {
                        final input = await showTimePicker(
                            context: context, initialTime: startTime);
                        if (input != null) {
                          startTime = input;
                          print(input);
                          // if (finishTime.compareTo(startTime) < 0) {
                          //   finishTime = TimeOfDay.fromDateTime(
                          //       startTime.toDateTime().add(Duration(hours: 1)));
                          // }
                        }
                      });
                    },
                    child: Icon(Icons.timer_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "${finishTime.hour}:${finishTime.minute} ${finishTime.period}"),
                  GestureDetector(
                    onTap: () {
                      setState(() async {
                        final input = await showTimePicker(
                            context: context, initialTime: finishTime);
                        if (input != null) {
                          finishTime = input;
                        }
                      });
                    },
                    child: Icon(Icons.timer_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
