import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Ensure you have this dependency

class SocialLoginButtonForApple extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color iconColor;

  const SocialLoginButtonForApple({
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
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
