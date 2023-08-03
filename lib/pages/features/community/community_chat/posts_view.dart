import 'package:ayura/widgets/features/community/header_btn.dart';
import 'package:flutter/material.dart';

//Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';

// Feature Widgets
import 'package:ayura/widgets/features/community/community_appbar.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() {
    return _PostsViewState();
  }
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profileIcon.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Ruchira Bogahawatta',
                style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(child: SizedBox()),
              Text(
                '20 mins ago',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.alternateGreyColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Challenge was to complete a 1 kilometer run for three consecutive days',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.textColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/postImage.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: AppColors.primaryColor, // Set the border color
                      width: 1.0, // Set the border width
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                icon: const Icon(
                  Icons.thumb_up,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
                label: const Text(
                  'Like',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: AppColors.primaryColor, // Set the border color
                      width: 1.0, // Set the border width
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
                label: const Text(
                  'Participate',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.primaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
