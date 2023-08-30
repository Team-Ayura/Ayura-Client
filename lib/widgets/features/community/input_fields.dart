import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class InputField extends StatelessWidget {
  InputField({this.maxLines = 1, super.key, this.onchanged});

  final int maxLines;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: const TextStyle(fontFamily: 'Inter'),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 1.0),
        ),
      ),
    );
  }
}
