import 'package:flutter/material.dart';

class buildSocialLoginButtonForGoogle extends StatelessWidget {
  final String assetPath; // Asset path for the image
  final String text;
  final VoidCallback onPressed;

  const buildSocialLoginButtonForGoogle({
    required this.assetPath,
    required this.text,
    required this.onPressed,
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
}
