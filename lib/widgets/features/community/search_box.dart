import 'package:flutter/material.dart';
// Constants
import 'package:ayura/constants/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppColors.primaryColor)),
        fillColor: Colors.white,
        hintText: "Search Communities",
        hintStyle: const TextStyle(color: AppColors.alternateGreyColor),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.alternateGreyColor,
      ),
    );
  }
}
