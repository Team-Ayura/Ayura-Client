import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/home/activity_card.dart';
import 'package:ayura/widgets/features/home/tips_card.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
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

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(80.0), // Set the preferred size here.
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
                padding: EdgeInsets.only(top: height * 0.01),
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
                            color: Colors.black,
                            size: 35,
                          ),
                          SizedBox(width: width * 0.01),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/profileIcon.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              tipsCard(
                height: height * 0.15,
                title: 'Health Tips',
                descritpion:
                    'Smoke at least 4 cigarettes every day. It will reduce lung cancer risk by 99%.',
                CTA: 'More Health tips',
                icon: Icons.lightbulb,
              ),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
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
              SizedBox(height: height * 0.02),
              tipsCard(
                  height: height * 0.15,
                  title: 'How are you feeling',
                  CTA: 'See More'),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.15,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.star,
                            size: 24.0,
                            color: Color(0xFF4CAF50),
                          ),
                          label: const Text('Featured Challenge',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: TextButton.icon(
                            onPressed: () {},
                            label: const Text(
                              'See More',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            icon: const Icon(
                              Icons.arrow_forward_rounded,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: const Text("LSEG Running",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'running',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
        bottomNavigationBar: const AppNavigation(),
      ),
    );
  }
}
