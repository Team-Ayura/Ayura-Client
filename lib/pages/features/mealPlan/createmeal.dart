import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Createmeal extends StatefulWidget {
  const Createmeal({Key? key}) : super(key: key);

  @override
  _CreatemealState createState() => _CreatemealState();
}

class _CreatemealState extends State<Createmeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Icons.arrow_back, Icons.more_vert, 'Create Meal',
          leftCallback: () => Navigator.pop(context)),
    );
  }
}
