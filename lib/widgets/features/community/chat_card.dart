import 'package:flutter/material.dart';
import 'package:ayura/utils/router.dart';
// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';

// Pages //Must navigate to the relevant Community Chat
import 'package:ayura/pages/features/community/community_chat/community_chat_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {required this.communityName,
      required this.visibiity,
      required this.memberCount,
      super.key});

  final String communityName;
  final String visibiity;
  final String memberCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageNavigator(context: context).nextPage(const CommunityChat());
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
            const Icon(
              Icons.person_outline_rounded,
              color: AppColors.primaryColor,
              size: 21,
            ),
            Text(
              memberCount,
              style: const TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.primaryColor,
                  fontSize: 13),
            ),
            // Aligned to the right
          ],
        ),
      ),
    );
  }
}
