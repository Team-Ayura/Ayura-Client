import 'package:flutter/material.dart';
import 'package:ayura/utils/router.dart';
// Constants
import 'package:ayura/constants/colors.dart';

// Pages //Must navigate to the relevant Community Chat
import 'package:ayura/pages/features/community/community_chat/community_chat_view.dart';

class ChatCardTwo extends StatelessWidget {
  const ChatCardTwo(
      {required this.communityName,
      required this.visibiity,
      required this.memberCount,
      required this.communityId,
      required this.onTapCallback,
      super.key});

  final String communityId;
  final String communityName;
  final String visibiity;
  final String memberCount;
  final Function onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCallback();
      }, // Navigator function
      child: Container(
        //Main chat box
        margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profileIcon.png'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    communityName,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    visibiity,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(191, 191, 191, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Join",
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            // Aligned to the right
          ],
        ),
      ),
    );
  }
}
