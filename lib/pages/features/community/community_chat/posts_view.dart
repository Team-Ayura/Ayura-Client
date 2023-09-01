import 'package:flutter/material.dart';
import 'dart:convert';
//Constants
import 'package:ayura/constants/colors.dart';
import 'dart:typed_data';
// Feature Widgets

class PostsView extends StatefulWidget {
  final String username;
  final String timeAgo;
  final String challengeDescription;
  final String? postImagePath;
  final String? profileImagePath;
  final VoidCallback? onPressed;
  final String base64ImageData;

  const PostsView({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.challengeDescription,
    required this.base64ImageData,
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
    // Decode the Base64 string to bytes
    Uint8List imageBytes = base64.decode(widget.base64ImageData);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.memory(
            // Display the image from bytes
            imageBytes,
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 15,
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
                  offset: const Offset(
                      0, 1), // Offset from the top to create a bottom shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.thumb_up,
                    size: 20,
                    color: AppColors.accentColor,
                  ),
                ),
                IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(
                    Icons.message_outlined,
                    size: 20,
                    color: AppColors.accentColor,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.send_rounded,
                    size: 20,
                    color: AppColors.accentColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
