import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomAppBar(
            appbarTitle: 'Settings',
            isBackBtn: true,
          ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profileIcon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Namadee Shakya',
                      style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20
                ),
                const Text('Connected Apps', style: AppStyles.subheadingTextStyle2),
                ConnectedAppWidget(appName: 'GoogleFit', appImagePath: 'assets/icons/connectedapps/googlefit.svg', mode: ConnectedAppModes.toggle),
                ConnectedAppWidget(appName: 'Thurula', appImagePath: 'assets/icons/connectedapps/thurula.svg', mode: ConnectedAppModes.open),
              ],
            ),
          )
      ),
    );
  }
}

enum ConnectedAppModes {toggle, open}

class ConnectedAppWidget extends StatefulWidget {
  final String appName;
  final String appImagePath;
  final ConnectedAppModes mode;
  const ConnectedAppWidget({super.key, required this.appName, required this.appImagePath, required this.mode});

  @override
  State<ConnectedAppWidget> createState() => _ConnectedAppWidgetState();
}

class _ConnectedAppWidgetState extends State<ConnectedAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.normal,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  widget.appImagePath, // Update with your image path
                  width: 70,
                  height: 70, // Optional color customization
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(widget.appName, style: AppStyles.bodyTextStyle),
              ),
            ],
          ),
          if(widget.mode == ConnectedAppModes.open)
            GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text('Open', style: AppStyles.subHeadingTextStyle3.copyWith(color: AppColors.backgroundColor),),
                ),
            )
          )
          else

        ]
      ),
    );
  }
}

