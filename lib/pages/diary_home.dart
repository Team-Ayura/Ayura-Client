import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/settings/settings.dart';
import 'package:ayura/pages/features/sleep_tracking/page1.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/home/activity_card.dart';
import 'package:ayura/widgets/features/home/diary_activity_card.dart';
import 'package:ayura/widgets/features/home/tips_card.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:ayura/widgets/features/community/challenge_card.dart'; // Challenge Card Widget

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Diary_Home extends StatefulWidget {
  const Diary_Home({Key? key}) : super(key: key);

  @override
  _Diary_HomeState createState() => _Diary_HomeState();
}

class _Diary_HomeState extends State<Diary_Home> {
  TextEditingController birthdayController = TextEditingController();

    String getGreeting() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String formattedDate = DateFormat('dd MMM yyyy').format(DateTime.now());
    String greeting = getGreeting();


    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(110.0), // Set the preferred size here.
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 110.0,
          title: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.07, width * 0.05, height * 0.04),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        greeting,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.textColor,
                        size: 35,
                      ),
                      SizedBox(width: width * 0.02),
                      GestureDetector(
                        onTap: (){
                          PageNavigator(context: context)
                              .nextPage(const SettingsPage());
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/profileIcon.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.2,
              child: Column(
                children: [
                  SizedBox(height: height * 0.01),
                  Expanded(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        children: [
                          diaryactivityCard(
                              text: 'Today Steps',
                              number: '0' ,
                              image: 'assets/icons/step_icon.png'),
                          SizedBox(width: width * 0.04),
                          diaryactivityCard(
                              text: 'Overall Mood',
                              number: 'Happy',
                              image: 'assets/icons/heart.png'),
                          SizedBox(width: width * 0.04),
                          diaryactivityCard(
                              text: 'Today Calories',
                              number: '0',
                              image: 'assets/icons/fire.png'),
                        ]),
                  ),
                  SizedBox(height: height * 0.02)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: height * 0.02),
               Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 158, 158, 158),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.emoji_emotions_outlined,
                            size: 24.0,
                            color: AppColors.yellowColor,
                          ),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'Mood Details ',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                           const SizedBox(width: 120),
                          TextButton(
                            onPressed: () {
                              PageNavigator(context: context)
                                  .nextPage(const SleepFirstPage());
                            }, 
                            child: const Text(
                              'Add Mood',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SvgPicture.asset('assets/icons/diary_add.svg'),
                              const SizedBox(height:10 ,),
                              const Text(
                                'Add Mood Details',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 205, 200, 200),
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                                              
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 158, 158, 158),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.mode_night_outlined,
                            size: 24.0,
                            color: AppColors.yellowColor,
                          ),
                          const SizedBox(width: 10),
                          const Flexible(
                            child: Text(
                              'Sleep Details ',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                           const SizedBox(width: 120),
                          TextButton(
                            onPressed: () {
                              PageNavigator(context: context)
                                  .nextPage(const SleepFirstPage());
                            }, 
                            child: const Text(
                              'Add Nap',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              SvgPicture.asset('assets/icons/diary_add.svg'),
                              const SizedBox(height:10 ,),
                              const Text(
                                'Add a Nap/Sleep',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 205, 200, 200),
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                                              
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 158, 158, 158),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.bar_chart_rounded,
                            size: 24.0,
                            color: AppColors.yellowColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Featured challenge',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              size: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        // Challenge Container
                        child: ChallengeCard(
                          //Must Pass other data also, such as challenge data
                          margin: 0,
                          padding: 5,
                          communityName: 'Positivity Pathway',
                          challengeName: 'Morning Walking Routine',
                          challengeType: 'Walking',
                          remainingTime: '5 Days',
                          completedCount: '1.1',
                          totalCount: '4 km',
                          startingDate: '2021-09-01',
                          endingDate: '2021-09-07',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
