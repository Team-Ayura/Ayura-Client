import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.appbarTitle,
    this.iconName = Icons.add, //Default Icon , Lightbulb icon
    this.isBackBtn = false,
    this.onPressed,
    super.key,
  });
  final String appbarTitle; // Appbar main title
  final IconData iconName; // Appbar Icon
  final bool isBackBtn; //Back Btn availaibility
  final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBackBtn,
      toolbarHeight: 90.0,
      title: Text(appbarTitle),
      centerTitle: true,
      elevation: 0, //dropshadow
      titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          color: Color.fromRGBO(75, 75, 75, 1),
          fontWeight: FontWeight.w600),
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.textColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(iconName),
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
