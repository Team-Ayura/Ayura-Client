import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:ayura/provider/models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:ayura/widgets/global/custom_grey_btn.dart';
// Community Feature Widgets
import 'package:ayura/widgets/features/community/multiselect_card.dart';

// Constants
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:provider/provider.dart';

class CreateCommunity extends StatefulWidget {
  const CreateCommunity({super.key});

  @override
  State<CreateCommunity> createState() {
    return _CreateCommunityState();
  }
}

class _CreateCommunityState extends State<CreateCommunity> {
  final List<String> dropdownItems = ['Public', 'Private'];
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = 'Public'; // Default selected item
  final List<String> _selectedCategories = [];
  String _communityName = '';
  String _communityDescription = '';

  void handleCategorySelection(String category, bool isSelected) {
    // Handle the selection change here
    if (isSelected) {
      _selectedCategories.add(category);
      // Add category to the selected list
    } else {
      // Remove category from the selected list
      _selectedCategories.remove(category);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed to create community
      final newCommunity = CommunityModel(
        id: '', // This will be assigned by the backend
        communityName: _communityName,
        communityDescription: _communityDescription,
        isPublic: _selectedItem == 'Public' ? true : false,
        categories: _selectedCategories,
        members: [],
      );

      Provider.of<CommunityProvider>(context, listen: false)
          .createCommunity(newCommunity);
    }
  }

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
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profileIcon.png'),
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
                TextFormField(
                  decoration: AppStyles.inputdec,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a community name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _communityName = value;
                  },
                ),
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
                TextFormField(
                  decoration: AppStyles.inputdec,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _communityDescription = value;
                  },
                ),
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
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: DropdownButtonFormField(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        items: dropdownItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value.toString();
                          });
                        },
                        value: _selectedItem,
                      ),
                    )
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
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      MultiSelectChip(
                        challengeCategory: 'Running',
                        onSelectionChanged: (isSelected) =>
                            handleCategorySelection('Running', isSelected),
                      ),
                      MultiSelectChip(
                        challengeCategory: 'Walking',
                        onSelectionChanged: (isSelected) =>
                            handleCategorySelection('Walking', isSelected),
                      ),
                      MultiSelectChip(
                        challengeCategory: 'Cycling',
                        onSelectionChanged: (isSelected) =>
                            handleCategorySelection('Cycling', isSelected),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                customButton(
                    tap: _submitForm,
                    width: 140,
                    text: 'Create',
                    icon: Icons.arrow_forward,
                    context: context),
              ],
            ),
          ),

          // Form fields
        ],
      ),
    );
  }
}
