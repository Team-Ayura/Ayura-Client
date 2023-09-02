import 'package:flutter/material.dart';
import 'package:ayura/utils/router.dart';
// Constants
import 'package:ayura/constants/colors.dart';

// Pages //Must navigate to the relevant Community Chat
import 'package:ayura/pages/features/community/community_chat/community_chat_view.dart';

class MemberCard extends StatelessWidget {
  const MemberCard(
      {required this.memberName, required this.memberMail, super.key});

  final String memberName;
  final String memberMail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageNavigator(context: context).nextPage(const CommunityChat(
          communityId: "64f02b738347e3aa26227165",
        ));
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
                    memberName,
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
                    memberMail,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(191, 191, 191, 1),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
              color: AppColors.primaryColor,
            ),

            // Aligned to the right
          ],
        ),
      ),
    );
  }
}
