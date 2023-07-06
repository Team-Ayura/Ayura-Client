import 'package:ayura/auth/login.dart';
import 'package:ayura/pages/features/register/page2.dart';
import 'package:ayura/pages/features/register/page3.dart';
import 'package:ayura/pages/features/register/page4.dart';
import 'package:ayura/pages/home.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/pages/features/register/page1.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _curr = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    children: _list,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_curr == 0) {
                          PageNavigator(context: context)
                              .nextPage(const Login());
                        }
                        _pageController.animateToPage(--_curr,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.bounceInOut);
                      },
                      child: Container(
                          height: 48,
                          width: MediaQuery.of(context!).size.width * 0.3,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_back,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Back',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )),
                    ),
                    customButton(
                        tap: () {
                          if (_curr == 3) {
                            PageNavigator(context: context)
                                .nextPage(const Home());
                          }

                          _pageController.animateToPage(++_curr,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.bounceInOut);
                        },
                        icon: Icons.arrow_forward,
                        text: 'Next',
                        context: context),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  final List<Widget> _list = <Widget>[
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
  ];
}
