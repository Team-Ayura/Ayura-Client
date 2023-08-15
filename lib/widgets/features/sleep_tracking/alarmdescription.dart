
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

class AlarmDescription extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String time;
  final double width;
  const AlarmDescription(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.width,
      required this.time})
      : super(key: key);

  @override
  _AlarmDescriptionState createState() => _AlarmDescriptionState();
}

class _AlarmDescriptionState extends State<AlarmDescription> {
  double horizontalPadding = 0.15;
  double verticalPadding = 0.1;
  double aspectRatio = 0.8;
  late double height;

  @override
  void initState() {
    super.initState();
    height = widget.width / aspectRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * verticalPadding,
          horizontal: widget.width * horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Row(
            children: [
              Icon(
                widget.iconData,
                color: AppColors.primaryColor,
                size: height * 0.15,
              ),
              const SizedBox(width: 5.0,),
              Text(
                widget.title,
                style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),

            ],
          ),
          Text(
            widget.time,
            style: const TextStyle(
              color:AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
      
        ],
      ),
    );
  }
}

