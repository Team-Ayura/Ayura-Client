import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/activityProviders/sportsProvider.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomPopUp extends StatefulWidget {
  final List<Sport> sports;

  const CustomPopUp({super.key, required this.sports});

  @override
  _CustomPopUpState createState() => _CustomPopUpState();
}

class _CustomPopUpState extends State<CustomPopUp> {
  List<Sport> filteredSports = [];

  @override
  void initState() {
    super.initState();
    filteredSports =
        widget.sports; // Initialize the filtered list with all sports
    print(widget.sports);
  }

  void searchSports(String query) {
    setState(() {
      // Filter the sports list based on the search query
      filteredSports = widget.sports
          .where(
              (sport) => sport.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleSportSelection(Sport sport) {
    setState(() {
      sport.isSelected = !sport.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: searchSports,
                decoration: InputDecoration(
                  hintText: 'Search sports',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: AppColors.textColor.withOpacity(0.075),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent), // Remove the underline
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent), // Remove the underline
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: filteredSports.length,
                    itemBuilder: (context, index) {
                      final sport = filteredSports[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () => toggleSportSelection(sport),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: sport.isSelected
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                              child: ListTile(
                                leading: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: sport.isSelected
                                        ? Colors.white
                                        : AppColors.textColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    sport.icon,
                                    width: 40,
                                    height: 40,
                                    // color:
                                    //     sport.isSelected ? Colors.white : null,
                                  ),
                                ),
                                title: Text(
                                  sport.name,
                                  style: TextStyle(
                                    color: sport.isSelected
                                        ? Colors.white
                                        : AppColors.textColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: sport.isSelected
                                ? Colors.white
                                : AppColors.textColor.withOpacity(0.3),
                            height: 1,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Consumer<SportsProvider>(
                    builder: (context, sportsProvider, _) {
                  return ElevatedButton(
                    onPressed: () {
                      // filtered out the sports
                      filteredSports = filteredSports
                          .where((sport) => sport.isSelected)
                          .toList();
                      // mapping to sport models
                      List<SportModel> filteredSportModels = filteredSports
                          .map((sport) => SportModel(
                                id: sport.id,
                                name: sport.name,
                                caloriesPerHour: sport.caloriesPerHour,
                                averageDuration:
                                    0, // You can set averageDuration to a default value or calculate it based on sport data
                                sportHistory: [], // Initialize the sportHistory list to an empty list or set it based on sport data
                              ))
                          .toList();

                      // passing them to the sport screen
                      // Navigator.of(context).pop(filteredSportModels);
                      sportsProvider.addNewSport(filteredSportModels);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sport {
  final String id;
  final int caloriesPerHour;
  final String name;
  final String icon;
  bool isSelected;

  Sport(
      {required this.id,
      required this.caloriesPerHour,
      required this.name,
      required this.icon,
      this.isSelected = false});
}
