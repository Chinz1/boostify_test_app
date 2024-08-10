import 'package:boostify_test_app/auth/screens/log_in_screen.dart';
import 'package:boostify_test_app/auth/screens/onboarding_second_screen.dart';
import 'package:boostify_test_app/auth/screens/onboarding_third_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class OnboardingFourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: w,
                      height: 600,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage("assets/onboarding_fourth_screen_logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 300),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: w,
                  padding: const EdgeInsets.all(16.0),
                  height: 466,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your Successful',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF003366),
                            ),
                          ), // Hand waving icon
                          SizedBox(width: 8),
                          Text(
                            'Journey Starts Here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color(0xFF003366),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Take your drive career to the next level with this app.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 48),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
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
                                builder: (context) => LogInScreen()),
                          );
                          // Handle "I'm a driver" button press
                        },
                        child: const Text(
                          "Login to Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildSocialLoginButtonForGoogle(
                              assetPath: 'assets/google_icon.webp', // Correct asset path
                              text: 'Google',
                              onPressed: () {
                                // Handle Google login
                              },
                            ),
                          ),
                          const SizedBox(width: 16), // Increased space between the buttons
                          Expanded(
                            child: _buildSocialLoginButtonForApple(
                              icon: FontAwesomeIcons.apple,
                              text: 'Apple',
                              onPressed: () {
                                // Handle Apple login
                              },
                              iconColor: Colors.black, // Apple icon color
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Handle "Login" tap
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "New to udrive? ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Create Account",
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
      ),
    );
  }

  Widget _buildSocialLoginButtonForGoogle({
  required String assetPath, // Asset path for the image
  required String text,
  required VoidCallback onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0), // Entirely circular edges
      border: Border.all(color: Colors.black), // Black border
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Entirely circular edges
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0), // Button padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        children: [
          Container(
            width: 30, // Adjust width as needed
            height: 30, // Adjust height as needed
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(assetPath), // Asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16), // Space between the image and text
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF003366),
              fontWeight: FontWeight.bold,
              fontSize: 13.0, // Adjust the font size if needed
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSocialLoginButtonForApple({
  required IconData icon,
  required String text,
  required VoidCallback onPressed,
  required Color iconColor,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0), // Entirely circular edges
      border: Border.all(color: Colors.black), // Black border
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Entirely circular edges
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0), // Button padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center content
        children: [
          FaIcon(icon, color: iconColor), // Icon color
          const SizedBox(width: 16), // Space between the icon and text
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF003366),
              fontWeight: FontWeight.bold,
              fontSize: 13.0, // Adjust the font size if needed
            ),
          ),
        ],
      ),
    ),
  );
}


}
