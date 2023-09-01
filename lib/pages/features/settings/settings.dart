import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/provider/activityProviders/googleAuthProvider.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

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
            padding: const EdgeInsets.all(25.0),
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
                        height: 100,
                        width: 100,
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
                      style: AppStyles.subheadingTextStyle2),
                      Text('namadee@gmail.com',
                          style: AppStyles.subHeadingTextStyle3.copyWith(color: AppColors.textColor.withOpacity(0.5))),
                      CustomProfileButton(
                        text: 'Edit Profile',
                        icon: Icons.arrow_forward_ios_rounded,
                        onTap: (){},
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.backgroundColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                    height: 20
                ),
                SettingsLabel(text: 'preferences'),
                SizedBox(
                  height: 20
                ),
                SettingsLabel(text: 'Connected Apps'),
                SizedBox(
                    height: 10
                ),
                ConnectedAppWidget(appName: 'Thurula', appImagePath: 'assets/icons/connectedapps/thurula.svg', mode: ConnectedAppModes.open),
                ConnectedAppWidget(appName: 'GoogleFit', appImagePath: 'assets/icons/connectedapps/googlefit.svg', mode: ConnectedAppModes.toggle),
              ],
            ),
          )
      ),
    );
  }
}

class CustomProfileButton extends StatelessWidget {
  final String text;
  VoidCallback onTap;
  IconData? icon;
  Color? backgroundColor = AppColors.primaryColor;
  Color? textColor = AppColors.backgroundColor;
  CustomProfileButton({super.key, required this.text, required this.onTap , this.icon, this.textColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
          children: [
            Text(text, style: AppStyles.subHeadingTextStyle3.copyWith( color: textColor, fontSize: 14),),
            const SizedBox(
              width: 10,
            ),
            Icon(icon, size: 13,),
          ],
      ),
        ),),
    );
  }
}


class SettingsLabel extends StatelessWidget {
  final String text;
  const SettingsLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.textColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text.toUpperCase(),
        style: AppStyles.subheadingTextStyle2.copyWith( color: AppColors.textColor.withOpacity(0.5), fontSize: 12,),),
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
      padding: const EdgeInsets.all(8),
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
            Consumer<GoogleAuthProvider>(
              builder: (context, googleAuthProvider, _) {
                return GFToggle(
                  onChanged: (val){
                    googleAuthProvider.toggleGoogleAuthorization(val != null ? !val : true);
                  },
                  value: googleAuthProvider.isUserAuthorized,
                  disabledTrackColor: AppColors.textColor.withOpacity(0.07),
                  disabledThumbColor: AppColors.backgroundColor,
                  enabledTrackColor: AppColors.primaryColor.withOpacity(0.5),
                  enabledThumbColor: AppColors.primaryColor,
                  type: GFToggleType.ios,
                );
              }
            )
        ]
      ),
    );
  }
}

