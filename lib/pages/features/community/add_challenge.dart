import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddChallenge extends StatefulWidget {
  final String communityId;
  const AddChallenge({Key? key, required this.communityId}) : super(key: key);

  @override
  _AddChallengeState createState() => _AddChallengeState();
}

class _AddChallengeState extends State<AddChallenge> {
  final List<String> dropdownItems = ['Running', 'Walking', 'Cycling'];
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = 'Running'; // Default selected item
  String _ChallengeName = '';
  String _ChallengeDescription = '';
  String _Distance = '';
  DateTimeRange? _selectedDateRange;
  final TextEditingController _dateRangeController = TextEditingController();

  Future<void> _openDatePicker() async {
    final pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (pickedDateRange != null && pickedDateRange != _selectedDateRange) {
      setState(() {
        _selectedDateRange = pickedDateRange;
        _dateRangeController.text =
            '${_selectedDateRange!.start.toLocal().toString().split(' ')[0]} - ${_selectedDateRange!.end.toLocal().toString().split(' ')[0]}';
      });
    }
  }

  @override
  void dispose() {
    _dateRangeController.dispose();
    super.dispose();
  }

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        Icons.arrow_back,
        Icons.more_vert,
        'Create Challenge',
        leftCallback: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: SvgPicture.asset(
              'assets/images/community/challenge.svg',
              width: width * 0.5,
            )),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 20, 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Field 1 - category
                    const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        'Category',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: DropdownButtonFormField(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          items: dropdownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value.toString();
                            });
                          },
                          value: _selectedItem,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Field 2 - Name
                    const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        'Challenge Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    TextFormField(
                      decoration: AppStyles.inputdec,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _ChallengeName = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Field 3 - Description
                    const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        'Challenge Description',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    TextFormField(
                      decoration: AppStyles.inputdec,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _ChallengeDescription = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Field 4 - Date Range
                    const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        'Date Range',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    TextFormField(
                      controller: _dateRangeController,
                      readOnly: true,
                      onTap: _openDatePicker,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 1.0),
                        ),
                        suffixIcon: IconButton(
                          color: AppColors.primaryColor,
                          onPressed: _openDatePicker,
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Field 5 - Distance
                    const SizedBox(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        'Distance',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    TextFormField(
                      decoration: AppStyles.inputdec,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a distance';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _Distance = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customButton(
                        tap: _submitForm,
                        width: 140,
                        text: 'Create',
                        icon: Icons.arrow_forward,
                        context: context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
