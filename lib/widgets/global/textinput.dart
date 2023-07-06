import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ayura/constants/styles.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.width,
    this.height,
    this.obscure,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String label;
  final double? width;
  final double? height;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Inter',
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(
          width: width, // Set your desired width here
          child: TextField(
            obscureText: obscure ?? true,
            style: TextStyle(backgroundColor: Colors.white),
            controller: controller,
            decoration: AppStyles().inputDecoration(hintText),
          ),
        ),
      ],
    );
  }
}
