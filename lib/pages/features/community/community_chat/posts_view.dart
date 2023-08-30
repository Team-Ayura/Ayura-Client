import 'package:flutter/material.dart';

//Constants
import 'package:ayura/constants/colors.dart';

// Feature Widgets

class PostsView extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String challengeDescription;
  final String? postImagePath;
  final String? profileImagePath;
  final VoidCallback? onPressed;

  const PostsView({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.challengeDescription,
    this.postImagePath,
    this.profileImagePath,
    this.onPressed,
  });

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
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                    widget.profileImagePath ?? 'assets/images/profileIcon.png'),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.username,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const Expanded(child: SizedBox()),
              Text(
                widget.timeAgo,
                style: const TextStyle(
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
          Text(
            widget.challengeDescription,
            style: const TextStyle(
              fontFamily: 'Inter',
              color: AppColors.textColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            widget.postImagePath ?? 'assets/images/postImage.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.alternateGreyColor
                          .withOpacity(0.2), // Shadow color with low opacity
                      spreadRadius: 1, // Spread radius
                      blurRadius: 1, // Blur radius
                      offset: const Offset(0,
                          1), // Offset from the top to create a bottom shadow
                    ),
                  ],
                ),
                child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.thumb_up,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.alternateGreyColor
                          .withOpacity(0.2), // Shadow color with low opacity
                      spreadRadius: 1, // Spread radius
                      blurRadius: 1, // Blur radius
                      offset: const Offset(0,
                          1), // Offset from the top to create a bottom shadow
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: const Icon(
                    Icons.message_outlined,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.alternateGreyColor
                          .withOpacity(0.2), // Shadow color with low opacity
                      spreadRadius: 1, // Spread radius
                      blurRadius: 1, // Blur radius
                      offset: const Offset(0,
                          1), // Offset from the top to create a bottom shadow
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation:
                        MaterialStateProperty.all(0.0), // Remove elevation

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
              ),
            ],
          )
        ],
      ),
    );
  }
}
