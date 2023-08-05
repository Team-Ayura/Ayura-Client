import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/selected_sport_page.dart';
import 'package:ayura/provider/activityProviders/sportsProvider.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:ayura/widgets/features/activity_tracking/chart.dart';
import 'package:ayura/widgets/features/activity_tracking/multi_selection_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SportsPage extends StatefulWidget {
  SportsPage({Key? key}) : super(key: key);
  List<SportModel> sports = [];
  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  // int activeIndex = 0; // -1 means no active index

  @override
  Widget build(BuildContext context) {
    // final NumberFormat numberFormat = NumberFormat('#,###');
    final sportsProvider = Provider.of<SportsProvider>(context);
    widget.sports = sportsProvider.selectedSports;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sports',
            style: TextStyle(color: AppColors.textColor),
          ),
        ),
        backgroundColor:
            Colors.white, // Change the background color of the AppBar to white
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0, // Change the color of the back button to black
        actions: [
          Consumer<SportsProvider>(builder: (context, sportsProvider, _) {
            return IconButton(
              onPressed: () async {
                print("clicked add");
                // List<SportModel> newList = await showPopUp(context);
                // // setState(() {
                // print(newList);
                // if (newList.isNotEmpty) {
                //   sportsProvider.addNewSport(newList);
                // }
                // });
                // Perform your action here when the icon is tapped
                showPopUp(context, sportsProvider.remainingSports());
              },
              icon: SvgPicture.asset(
                'assets/icons/features/activity_tracking/add_circled.svg', // Replace 'your_icon' with the actual asset path
              ),
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<SportsProvider>(builder: (context, sportsProvider, _) {
          widget.sports = sportsProvider.selectedSports;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // List of Sports Boxes
              if (widget.sports.isNotEmpty)
                for (int index = 0; index < widget.sports.length; index++)
                  Slidable(
                    key: Key(widget.sports[index].id),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () =>
                            sportsProvider.removeSportFromWorkspace(widget
                                .sports[index]
                                .id), // move the sport to allsports
                      ),
                      children: [
                        SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Colors.redAccent,
                            onPressed: (context) => {
                                  sportsProvider.removeSportFromWorkspace(
                                      widget.sports[index].id),
                                })
                      ],
                    ),
                    child: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          // navigate to the selected sport page
                          final slidable = Slidable.of(context)!;
                          final isOpen = slidable.actionPaneType.value !=
                              ActionPaneType.none;
                          if (isOpen) {
                            slidable.close();
                          } else {
                            PageNavigator(context: context).nextPage(
                                SelectedSportPage(
                                    selectedSport: widget.sports[index]));
                          }
                        },
                        child: Container(
                          // margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors
                                .backgroundColor, // Set your desired box color here
                            borderRadius: BorderRadius.circular(8.0),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.shade300,
                            //     blurRadius: 5,
                            //     offset: const Offset(0, 3),
                            //   ),
                            // ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.textColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/features/activity_tracking/sports/${widget.sports[index].name.trim().toLowerCase()}.svg',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.sports[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.textColor),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
              // If sports list is empty, show the information text
              if (widget.sports.isEmpty)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/activity_tracking/sports_placeholder.svg',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 60, right: 60, top: 10, bottom: 20),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'You currently have not selected any sports. Use the add ',
                                style: TextStyle(
                                  color: AppColors.textColor.withOpacity(0.4),
                                ),
                              ),
                              const TextSpan(
                                text: '"+"', // The "+" symbol
                                style: TextStyle(
                                  color: AppColors
                                      .textColor, // Change the color of "+" here
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' button to include sports in your sports collection.',
                                style: TextStyle(
                                  color: AppColors.textColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              // About section
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Sports',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey
                            .shade200, // Set your desired button color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Unleash the sports\' potential in our app! Connect globally, enhance health, teamwork, and grow personally. Join us to share the passion, unite cultures, and play together. Let\'s start!',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textColor.withOpacity(0.4)),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  void showPopUp(BuildContext context, List<Sport> sports) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUp(
          sports: sports,
        );
      },
    );
  }
}
