import 'package:boostify_test_app/auth/screens/onboarding_fourth_screen.dart';
import 'package:boostify_test_app/auth/widget/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class OnboardingThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 327,
                  height: 374,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(20), // Slightly curved edges
                    image: const DecorationImage(
                      image:
                          AssetImage("assets/onboarding_third_screen_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between the containers
                Container(
                  width: w,
                  padding: const EdgeInsets.all(16.0),
                  height: 373,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 20),
                                Text(
                                  'Solution for drivers',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28,
                                    color: Color(0xFF003366),
                                  ),
                                ),
                              ],
                            ), // Hand waving icon
                            SizedBox(height: 8),
                            Text(
                              'striving for',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: Color(0xFF003366),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'successful work',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: Color(0xFF003366),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Be part of a new era of work with this innovative app',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularIconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnboardingFourthScreen()), // Navigate to the new screen
                                    );
                                  },
                                ),
                              ],
                            ), // Your CircularIconButton widget
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
