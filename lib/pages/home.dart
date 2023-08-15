import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/sleep_tracking/page1.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/home/activity_card.dart';
import 'package:ayura/widgets/features/home/tips_card.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:ayura/widgets/features/community/challenge_card.dart'; // Challenge Card Widget
import 'package:ayura/widgets/features/mood_traking/mood_chips.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Good Morning!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600)),
                      Text('Namadee Shakya',
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 54, 54),
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
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
                      Container(
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
              height: height * 0.35,
              child: Column(
                children: [
                  SizedBox(height: height * 0.01),
                  tipsCard(
                    height: height * 0.15,
                    title: 'Health tips',
                    descritpion:
                        'Aim to drink at least 8 glasses (about 2 liters) of water daily!',
                    cta: ' ',
                    icon: Icons.lightbulb,
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        children: [
                          activityCard(
                              text: 'Step Count',
                              number: 2548,
                              image: 'assets/icons/step_icon.png'),
                          SizedBox(width: width * 0.04),
                          activityCard(
                              text: 'Heart Rate',
                              number: 2548,
                              image: 'assets/icons/heart.png'),
                          SizedBox(width: width * 0.04),
                          activityCard(
                              text: 'Calories',
                              number: 2548,
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(69, 158, 158, 158),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'How are you feeling today?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
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
                      SizedBox(height: 10),
                      //Moods
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MoodButton(emojiName: 'Happy', mood: 'Happy'),
                            SizedBox(
                              width: 10,
                            ),
                            MoodButton(emojiName: 'Tired', mood: 'Tired'),
                            SizedBox(
                              width: 10,
                            ),
                            MoodButton(emojiName: 'calm', mood: 'Calm'),
                            SizedBox(
                              width: 10,
                            ),
                            MoodButton(emojiName: 'Tired', mood: 'Tired'),
                            SizedBox(
                              width: 10,
                            ),
                            MoodButton(emojiName: 'Tired', mood: 'Tired'),
                          ],
                        ),
                      )
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
                            'Featured Challenge',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
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
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 10.0),
                      //   child: Text("LSEG Running",
                      //       style: TextStyle(
                      //           fontSize: 25, fontWeight: FontWeight.w600)),
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 10.0),
                      //   child: Text(
                      //     'running',
                      //     style: TextStyle(
                      //       color: Color.fromARGB(255, 134, 134, 134),
                      //       fontSize: 16.0,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 5),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //   child: LinearProgressIndicator(
                      //     minHeight: 8,
                      //     value: 0.5,
                      //     backgroundColor: Colors.grey[300],
                      //     valueColor: const AlwaysStoppedAnimation<Color>(
                      //         AppColors.primaryColor),
                      //   ),
                      // ),

                      SizedBox(
                        // Challenge Container
                        child: ChallengeCard(
                          //Must Pass other data also, such as challenge data
                          margin: 0,
                          padding: 5,
                          communityName: 'Diabetes Support Circle',
                          challengeName: 'LSEG Running',
                          challengeType: 'Running',
                          remainingTime: '7 Days',
                          completedCount: '1.6',
                          totalCount: '2 km',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),



                //sleep
                Card(
                elevation: 1, // Adjust elevation for shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                ),
                child: ListTile(
                    horizontalTitleGap: 25.0,
                  contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 8),
                  title: const Text('How many hours did you sleep? ',style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
                  subtitle: const Text("Establish a consistent Sleep Schedule"),
                  trailing: TextButton(onPressed: () {PageNavigator(context: context).nextPage( const SleepFirstPage());}, child:Icon( Icons.arrow_forward,))
                ),
                  ),


              ],
            ),
          )
        ]),
      ),

      // child: Column(
      //   children: [
      //     tipsCard(
      //       height: height * 0.15,
      //       title: 'Health Tips',
      //       descritpion:
      //           'Smoke at least 4 cigarettes every day. It will reduce lung cancer risk by 99%.',
      //       CTA: 'More Health tips',
      //       icon: Icons.lightbulb,
      //     ),
      //     SizedBox(height: height * 0.02),
      //     Expanded(
      //       child: ListView(
      //           scrollDirection: Axis.horizontal,
      //           shrinkWrap: true,
      //           children: [
      //             activityCard(
      //                 text: 'Step Count',
      //                 number: 2548,
      //                 image: 'assets/icons/step_icon.png'),
      //             SizedBox(width: width * 0.04),
      //             activityCard(
      //                 text: 'Heart Rate',
      //                 number: 2548,
      //                 image: 'assets/icons/heart.png'),
      //             SizedBox(width: width * 0.04),
      //             activityCard(
      //                 text: 'Calories',
      //                 number: 2548,
      //                 image: 'assets/icons/fire.png'),
      //           ]),
      //     ),
      //     SizedBox(height: height * 0.02),

      bottomNavigationBar: const AppNavigation(),
    );
  }
}
