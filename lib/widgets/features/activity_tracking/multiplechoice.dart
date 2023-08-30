import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

class MultipleChoiceController {
  late List<bool> selectedOptions;

  MultipleChoiceController(int itemCount) {
    selectedOptions = List.generate(itemCount, (index) => false);
  }
}

class MultipleChoiceWidget extends StatefulWidget {
  final List<String> labelList;
  final MultipleChoiceController? controller;
  MultipleChoiceWidget({Key? key, required this.labelList, required this.controller}) : super(key: key);
  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.labelList.length / 3 + 1).ceil() * 40,
      child: GridView.builder(
        itemCount: widget.labelList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: (50 / 40), // Width / Height ratio of each item
        ),
        itemBuilder: (context, index) {
          return _buildClickableBox(widget.labelList[index], index);
        },
      ),
    );
  }

  Widget _buildClickableBox(String label, int index) {
    return GestureDetector(
      onTap: () {
        // Handle box tap here
        setState(() {
          widget.controller!.selectedOptions[index] = widget.controller!.selectedOptions[index] ? false : true;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          // width: 50,
          height: 40,
          decoration: BoxDecoration(
            color: widget.controller!.selectedOptions[index]
                ? AppColors.primaryColor
                : const Color.fromRGBO(255, 255, 255, 1.0),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryColor, width: 1.5),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: widget.controller!.selectedOptions[index]
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
