import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

class AverageSleepCard extends StatefulWidget {
  
  final String duration;
  AverageSleepCard({required this.duration});

  @override
  State<AverageSleepCard> createState() => _AverageSleepCardState();
}

class _AverageSleepCardState extends State<AverageSleepCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,0),
      child: Card(
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.duration,
                            style: TextStyle(color: Color(0xFF878787),fontFamily: 'Inter',fontSize: 14,),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.yellow,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Not enough',
                                style: TextStyle(color: Color(0xFF878787),fontFamily: 'Inter',fontSize: 14,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Average Sleep',
                          style: TextStyle(fontSize:18,color: AppColors.primaryColor,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
    
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '05h 35m',
                          style: TextStyle(fontSize:32,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                
                  ),
                  const SizedBox(height: 8),
                ], 
              ),
            ),
          ),
    );
  }
}
