import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    required this.dropdownItems,
    super.key,
  });

  final List<String> dropdownItems;

  @override
  State<CustomDropdown> createState() {
    return _CustomDropdownState();
  }
}

class _CustomDropdownState extends State<CustomDropdown> {
  // Initial Selected Value
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    // Initialize selectedValue to the first item in dropdownItems if not set
    if (selectedValue.isEmpty) {
      selectedValue = widget.dropdownItems[0];
    }
    return DropdownButton(
      // Initial Value
      value: selectedValue,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      // Down Arrow Icon
      icon: const Icon(
        Icons.keyboard_arrow_down,
      ),
      iconEnabledColor: AppColors.primaryColor,

      // Array list of items
      items: widget.dropdownItems.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      underline: const SizedBox(),
    );
  }
}
