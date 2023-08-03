import 'package:ayura/widgets/features/activity_tracking/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CyclingTripWidget extends StatelessWidget {
  final String date;
  final String startTime;
  final String distance;
  final String duration;
  final String rideName;

  CyclingTripWidget({
    required this.date,
    required this.startTime,
    required this.distance,
    required this.duration,
    required this.rideName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // update with the cycletriphistory() route
          // PageNavigator(context: context).nextPage(Activities());
        },
        child: Container(
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          child: Row(
            children: [
              MapContainer(
                isRegular: false,
                latitude: 37.7749,
                longitude: -122.4194,
                markerTitle: 'Title',
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rideName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/features/activity_tracking/calendar.svg',
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date + ', ' + startTime,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/features/activity_tracking/lightning.svg',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            distance,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/features/activity_tracking/timer.svg',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            duration,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
