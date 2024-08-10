import 'package:boostify_test_app/auth/screens/log_in_screen.dart';
import 'package:boostify_test_app/auth/screens/onboarding_second_screen.dart';
import 'package:boostify_test_app/auth/screens/onboarding_third_screen.dart';
import 'package:flutter/material.dart';

class OnboardingFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 15, 161),
        // backgroundColor: Colors.blue[900],
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 187.85,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage("assets/onboarding_screen_logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 300),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(
                    16.0), // Add padding to ensure the icon is not too close to the edge
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 30.0, // Adjust the size of the icon as needed
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '👋',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ), // Hand waving icon
                        SizedBox(width: 8),
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Choose how you will use the app for better experience',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        minimumSize: Size(w, 50), // Button width and height
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingThirdScreen()),
                        );
                        // Handle "I'm a driver" button press
                      },
                      child: const Text(
                        "I'm a driver",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        minimumSize: Size(w, 50), // Button width and height
                      ),
                      onPressed: () {
                        // Navigate to OnboardingSecondScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingSecondScreen()),
                        );
                      },
                      child: const Text(
                        "I'm a mechanic",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle "Login" tap
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInScreen()),
                        );
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
