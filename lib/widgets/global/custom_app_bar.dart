import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String? title;
  final Function? leftCallback;
  final Function? rightCallback;
  CustomAppBar(this.leftIcon, this.rightIcon, this.title,
      {this.leftCallback, this.rightCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        // top: MediaQuery.of(context).padding.top,
        top: 50,
        left: 25,
        right: 25,
      ),
      //appbar with title and back icon and righticon
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(leftIcon),
            ),
          ),
          //middle title
          Text(
            title ?? "",
            style: AppStyles.subheadingTextStyle2,
          ),
          //right icon
          GestureDetector(
            onTap: rightCallback != null ? () => rightCallback!() : null,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                rightIcon,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
