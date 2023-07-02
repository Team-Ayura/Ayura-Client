import 'package:flutter/material.dart';
import 'package:ayura/constants/styles.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: AppStyles.containerDecoration,
      child: TextField(
        controller: controller,
        decoration: AppStyles().inputDecoration(hintText),
      ),
    );
  }
}
