import 'package:boostify_test_app/auth/screens/onboarding_fourth_screen.dart';
import 'package:boostify_test_app/auth/widget/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class OnboardingSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 15, 161),
        body: Stack(
          children: [
            Positioned(
              top: h * 0.2, // Position the image slightly down from the top
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 234,
                  height: 467.21,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/onboarding_second_screen_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * 0.32,
              right: w * 0.7,
              child: Container(
                child: Transform.rotate(
                  angle:
                      -0.1, // Adjust the angle as needed to tilt it slightly to the left
                  child: const Text(
                    '🤩',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48, // Enlarged size
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * 0.37,
              right: w * 0.32,
              child: Container(
                child: Transform.rotate(
                  angle: 0.1,
                  child: const Text(
                    '😎',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: w,
                padding: const EdgeInsets.all(16.0),
                height: 341,
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
                                'Make your way more',
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
                            'comfortable',
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
                          const Text(
                            'Find the mechanic along the entire route without',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            'interrupting your route using this platform',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
