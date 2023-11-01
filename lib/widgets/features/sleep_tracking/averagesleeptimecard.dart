import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

class AverageSleepCard extends StatefulWidget {
  
  final String duration;
  const AverageSleepCard({super.key, required this.duration});

  
  @override
  State<AverageSleepCard> createState() => _AverageSleepCardState();
}

class _AverageSleepCardState extends State<AverageSleepCard> {

  String getAvgSleepDuration(){
    if(widget.duration == "Week"){
        return '05h 35m';
    }
    else if(widget.duration == "Fortnight"){
        return '06h 25m';
    }
    else{
        return '05h 15m';
    }
    
    
    
  }

  @override
  Widget build(BuildContext context) {
  String avgSleepDuration =  getAvgSleepDuration();

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
                            style: const TextStyle(color: Color(0xFF878787),fontFamily: 'Inter',fontSize: 14,),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 228, 8, 8),
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Insufficient',
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
    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          avgSleepDuration,
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
