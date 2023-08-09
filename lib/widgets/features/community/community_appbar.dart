import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class CommunityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppBar({
    required this.appbarTitle,
    required this.visibility,
    required this.memberCount,
    // this.onPressed,
    super.key,
  });
  final String appbarTitle; // Appbar main title
  final String visibility;
  final String memberCount;
  // final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.textColor),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileIcon.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appbarTitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      visibility,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.textColor,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.alternateGreyColor,
                      size: 20,
                    ),
                    Text(
                      memberCount,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        color: AppColors.alternateGreyColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.textColor,
          ), // Replace with your desired icon
          onPressed: () {
            // Handle the action of the right-side icon here.
            // For example, you can open a settings screen.
          },
        ),
      ],
    );
  }
}
