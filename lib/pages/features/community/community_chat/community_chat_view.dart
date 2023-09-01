import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/community/add_challenge.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/community/add_member.dart';
import 'package:ayura/widgets/features/community/header_btn.dart';
import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:flutter/material.dart';
import 'package:ayura/provider/communityProviders/community_provider.dart';
import 'package:provider/provider.dart';
import 'package:ayura/provider/models/community_model.dart';
import 'package:ayura/pages/features/community/community_chat/posts_view.dart';
import 'package:ayura/pages/features/community/community_chat/leaderboard_view.dart';
import 'package:ayura/pages/features/community/community_chat/challenge_details_view.dart';
import 'package:provider/provider.dart';
import 'package:ayura/provider/models/post_model.dart';

import 'package:ayura/widgets/features/community/comment_section.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
//Constants
import 'package:ayura/constants/colors.dart';

// Feature Widgets
import 'package:ayura/widgets/features/community/community_appbar.dart';

class CommunityChat extends StatefulWidget {
  const CommunityChat({required this.communityId, super.key});

  final String communityId;
  @override
  State<CommunityChat> createState() {
    return _CommunityChatState();
  }
}

class _CommunityChatState extends State<CommunityChat> {
  String activeComponent = 'Overview'; // Keeps track of the active UI component
  //For now I am declaring this here needs to come from before screen
  String commmunityId = '';
  late File _image;
  String base64Image = '';
  String _postCaption = "";
  Color _uploadIconColor = AppColors.alternateGreyColor;

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(
            pickedFile.path); // Initialize _image when an image is selected
        base64Image = base64Encode(_image.readAsBytesSync());
        print('Image selected.');

        setState(() {
          _postCaption = "";
          _uploadIconColor = AppColors.accentColor;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  void _submitPostForm() {
    final newPost = PostModel(
      id: "",
      authorName: "",
      caption: _postCaption,
      imageUrl: base64Image,
      authorId: "649e52033a23be6f73bfecc4",
      //Need to fetch real author ID later
      communityId: widget.communityId,
    );

    Provider.of<CommunityProvider>(context, listen: false).submitPost(newPost);
    setState(() {
      _postCaption = "";
      _uploadIconColor = AppColors.alternateGreyColor;
    });
  }

  void updateActiveComponent(String component) {
    setState(() {
      activeComponent = component;
    });
  }

  void openCommentSection() {
    //Open the Comment Section
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const CommentSection(),
    );
  }

  void openCommunitySettingsOverlay() {
    // Open the Community Settings Section
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return communitySettings(); // Call the function to return the widget
      },
    );
  }

  // Community Settings Section Widget
  Padding communitySettings() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Community Settings",
              style: AppStyles.subheadingTextStyle2,
            ),
            const SizedBox(
              height: 15,
            ),
            // Settings
            GestureDetector(
              onTap: (() {
                PageNavigator(context: context).nextPage(AddMember(
                  communityId: commmunityId,
                ));
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Add Members",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                PageNavigator(context: context).nextPage(AddChallenge(
                  communityId: commmunityId,
                ));
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Add Challenges",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Update Community",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Access widget properties within initState
    commmunityId = widget.communityId;
    Provider.of<CommunityProvider>(context, listen: false)
        .getCommunityById(commmunityId); //Initializing the community list
    Provider.of<CommunityProvider>(context, listen: false)
        .getPostsList(commmunityId); //Initializing the community list
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Consumer<CommunityProvider>(
          builder: (ctx, communityProvider, _) {
            CommunityModel community = communityProvider.communityModel;
            return CommunityAppBar(
              appbarTitle: community.communityName,
              visibility: community.isPublic ? "Public" : "Private",
              memberCount: community.members.length.toString(),
              onPressed: openCommunitySettingsOverlay,
            );
          },
        ),
      ),
      body: Container(
        width: double.infinity, //Take the whole available width of the device
        padding: EdgeInsets.fromLTRB(
            width * 0.02, height * 0.01, width * 0.02, height * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //The 3 buttons
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderButton(
                  buttonName: 'Overview',
                  onPressed: () => updateActiveComponent('Overview'),
                  isActive: activeComponent == 'Overview',
                ),
                HeaderButton(
                  buttonName: 'Leaderboard',
                  onPressed: () => updateActiveComponent('Leaderboard'),
                  isActive: activeComponent == 'Leaderboard',
                ),
                HeaderButton(
                  buttonName: 'Challenges',
                  onPressed: () => updateActiveComponent('Challenge'),
                  isActive: activeComponent == 'Challenge',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (activeComponent == 'Overview') //Posts View

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //FEEDSHARE BOX
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/profileIcon.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      _postCaption = value;
                                    },
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true, // Set filled to true
                                      fillColor: AppColors.backgroundColor,
                                      hintText: "What are your thoughts today?",
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                            color: AppColors.alternateGreyColor,
                                            width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: getImage,
                                  icon: Icon(
                                    Icons.perm_media_rounded,
                                    size: 20,
                                    color: _uploadIconColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  onPressed: _submitPostForm,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      const BorderSide(
                                        color: AppColors
                                            .primaryColor, // Border color
                                        width: 1.0, // Border width
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12.0), // Adjust the border radius
                                      ),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Share',
                                        style: TextStyle(
                                          fontSize: 14, // Adjust the text size
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.send_rounded,
                                        color: AppColors
                                            .primaryColor, // Set the icon color
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Checkout the latest posts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: height * 0.65,
                        child: Consumer<CommunityProvider>(
                            builder: (ctx, communityProvider, _) {
                          List<PostModel> posts = communityProvider.postsList;
                          return ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              PostModel post = posts[index];
                              return PostsView(
                                base64ImageData: post.imageUrl,
                                username: post.authorName,
                                timeAgo: "10 mins",
                                challengeDescription: post.caption,
                                onPressed: openCommentSection,
                              );
                            },
                          );
                        }),
                      )
                    ],
                  ),
                ),
              )
            else if (activeComponent == 'Leaderboard')
              const LeaderboardView()
            else if (activeComponent == 'Challenge')
              const ChallengeDetailsView(),
          ],
        ),
      ),
    );
  }
}
