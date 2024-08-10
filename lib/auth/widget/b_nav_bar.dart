import 'package:boostify_test_app/calender_screen.dart';
import 'package:boostify_test_app/plus_screen.dart';
import 'package:boostify_test_app/grid_screen.dart';
import 'package:boostify_test_app/profile_screen.dart';
import 'package:boostify_test_app/project_summary_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const GridViewScreen(),
    ProjectSummaryScreen(),
    const PlusScreen(), // Placeholder for the plus button
    CalenderScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipPath(
        clipper: CustomClipperShape(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white, // Set background color to red
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              activeIcon: Icon(
                Icons.grid_view_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.source_outlined),
              activeIcon: Icon(
                Icons.source_rounded,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.transparent),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              activeIcon: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              activeIcon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: '',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the plus button tap
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 36),
      ),
    );
  }
}


class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 50); // Start at the top left, but 20px down
    path.quadraticBezierTo(0, 0, 20, 0); // Top-left curve
    path.lineTo(size.width - 50, 0); // Top edge
    path.quadraticBezierTo(size.width, 0, size.width, 20); // Top-right curve
    path.lineTo(size.width, size.height); // Right edge
    path.lineTo(0, size.height); // Bottom edge
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
