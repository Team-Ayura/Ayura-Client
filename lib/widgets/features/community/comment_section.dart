import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:ayura/widgets/global/custom_grey_btn.dart';
// Community Feature Widgets
import 'package:ayura/widgets/features/community/input_fields.dart';
import 'package:ayura/widgets/features/community/custom_dropdown.dart';
import 'package:ayura/widgets/features/community/multiselect_card.dart';

// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() {
    return _CommentSectionState();
  }
}

Container commentBox(
    {required String comment,
    required String username,
    String? profileImgUrl}) {
  profileImgUrl ??=
      "assets/images/profileIcon.png"; // Use ??= to assign a default value

  return Container(
    padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profileImgUrl),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                username,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                comment,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class _CommentSectionState extends State<CommentSection> {
  final List<String> dropdownItems = ['Public', 'Private'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message_outlined,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 8),
                Text(
                  'Comments',
                  style: AppStyles.subheadingTextStyle2,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: [
                  commentBox(
                    username: "Ruchira Bogahawatta",
                    comment:
                        "Lorem ipsum dolor sit amet, consectetur asdasdasd ",
                  ),
                  commentBox(
                    username: "Ruchira Bogahawatta",
                    comment:
                        "Lorem ipsum dolor sit amet, consectetursda sdasd ",
                  ),
                  commentBox(
                    username: "Ruchira Bogahawatta",
                    comment:
                        "Lorem ipsum dolor sit amet, consectetursdasdas d ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
