import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

class TipChip extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const TipChip({super.key, required this.title, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        border: Border.all(color: Colors.grey), // Border color
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Image.asset(image,width: 100.0,height:100.0,),
      ),
    );
  }
}