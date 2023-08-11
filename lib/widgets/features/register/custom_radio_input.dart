import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final int index;
  final int value;
  final IconData? icon;
  final EdgeInsets? padding;
  final Function(int) onChanged;

  const CustomRadioButton({super.key, 
    required this.text,
    required this.index,
    required this.value,
    required this.onChanged,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        onChanged(index);
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            padding ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        backgroundColor: MaterialStateProperty.all<Color>(
            value == index ? AppColors.primaryColor : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(
                color: value == index
                    ? AppColors.primaryColor
                    : const Color(0xFF9C9C9C)),
          ),
        ),
      ),
      child: icon != null
          ? Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: (value == index) ? Colors.white : const Color(0xFF9C9C9C),
                ),
                const SizedBox(width: 5),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: (value == index) ? Colors.white : const Color(0xFF9C9C9C),
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: (value == index) ? Colors.white : const Color(0xFF9C9C9C),
              ),
            ),
    );
  }
}
