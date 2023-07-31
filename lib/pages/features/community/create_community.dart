import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:ayura/widgets/global/custom_grey_btn.dart';
import 'package:ayura/utils/router.dart';
// Community Feature Widgets
import 'package:ayura/widgets/features/community/input_fields.dart';
import 'package:ayura/widgets/features/community/custom_dropdown.dart';
import 'package:ayura/widgets/features/community/multiselect_card.dart';

// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() {
    return _CreateCommunityState();
  }
}

class _CreateCommunityState extends State<CreateCommunity> {
  final List<String> dropdownItems = ['Public', 'Private'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //Take the whole available width of the device
      padding: const EdgeInsets.fromLTRB(20, 35, 20, 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Create a Community',
            style: AppStyles.subheadingTextStyle2,
          ),
          const SizedBox(
            height: 20,
          ),
          //Profile Picture upload section
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 70,
                height: 70,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profileIcon.png'),
                  radius: 35,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              customGreyButton(
                  tap: () {},
                  width: 180,
                  text: 'Upload Image',
                  icon: Icons.upload,
                  context: context),

              const SizedBox(
                height: 20,
              ),
              //Field 1 - Name
              const SizedBox(
                height: 20,
                width: double.infinity,
                child: Text(
                  'Community Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              const InputField(),
              const SizedBox(
                height: 20,
              ),
              //Field 2 - Description
              const SizedBox(
                height: 20,
                width: double.infinity,
                child: Text(
                  'Community Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              const InputField(maxLines: 2),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Visibility',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: CustomDropdown(dropdownItems: dropdownItems),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //Field 4 Challenge Categories
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Challenge Categories',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    MultiSelectChip(challengeCategory: 'Running'),
                    MultiSelectChip(challengeCategory: 'Walking'),
                    MultiSelectChip(challengeCategory: 'Cycling'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              customButton(
                  tap: null,
                  width: 140,
                  text: 'Create',
                  icon: Icons.arrow_forward,
                  context: context),
            ],
          ),

          // Form fields
        ],
      ),
    );
  }
}
