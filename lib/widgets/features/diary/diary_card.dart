import 'package:flutter/material.dart';

// Constants
import 'package:ayura/constants/colors.dart';

class DiaryCard extends StatelessWidget {
const DiaryCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
       decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),

    );
  }
}