import 'package:flutter/material.dart';

//Constants
import 'package:ayura/constants/colors.dart';

class HeaderButton extends StatefulWidget {
  const HeaderButton({
    required this.buttonName,
    this.onPressed,
    this.buttonType = "",
    required this.isActive,
    super.key,
  });

  final String buttonName;
  final String buttonType;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  State<HeaderButton> createState() {
    return _HeaderButtonState();
  }
}

class _HeaderButtonState extends State<HeaderButton> {
  Color getBorderColor() {
    if (widget.isActive) {
      if (widget.buttonType == 'textButton') {
        return Colors.transparent; //color when active-textButton
      } else {
        return AppColors.primaryColor; // color when active
      }
    } else if (!widget.isActive && widget.buttonType == 'textButton') {
      return Colors.transparent; //
    } else {
      return AppColors.alternateGreyColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              // Check if the button is active and change the background color accordingly
              if (widget.isActive) {
                if (widget.buttonType == 'textButton') {
                  return Colors.transparent; //color when active
                }
                return AppColors
                    .primaryColor; // Set the desired color when active
              }
              return Colors.transparent; // Set the default background color
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
              side: BorderSide(
                color: getBorderColor(),
              ),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10.0),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonName,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: widget.isActive
                ? widget.buttonType == 'textButton'
                    ? AppColors
                        .primaryColor // Color when active and buttonType is 'textButton'
                    : Colors
                        .white // Set the desired color when active and buttonType is not 'textButton'
                : AppColors.alternateGreyColor, // Color when inactive
          ),
        ),
      ),
    );
  }
}
