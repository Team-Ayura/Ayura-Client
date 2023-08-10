import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final List<String> labelList;
  MultipleChoiceWidget({Key? key, required this.labelList}) : super(key: key);
  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  // Keep track of the selected days
  late List<bool> _selectedOptions;
  @override
  void initState() {
    super.initState();
    _selectedOptions = List.generate(widget.labelList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.labelList.length / 3 + 1).ceil() * 40,
      child: GridView.builder(
        itemCount: widget.labelList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          _selectedOptions[index] = _selectedOptions[index] ? false : true;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          // width: 50,
          height: 40,
          decoration: BoxDecoration(
            color: _selectedOptions[index]
                ? AppColors.primaryColor
                : Color.fromRGBO(255, 255, 255, 1.0),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primaryColor, width: 1.5),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: _selectedOptions[index]
                    ? Color.fromRGBO(255, 255, 255, 0)
                    : AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
