import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'ReportScreen.dart';
import 'combined/c1/upperBodyCoreOne.dart';
import 'combined/c2/upperBodyBackOne.dart';
import 'combined/c3/coreLowerBodyOne.dart';
import 'combined/c4/fullBodySeatedOne.dart';
import 'single/s1/upperOne.dart';
import 'single/s2/lowerOne.dart';
import 'single/s3/coreOne.dart';
import 'single/s4/backOne.dart';
import 'single/s5/shoulderOne.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0; // Variable to track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? _buildHomeContent() : _buildOtherContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment), // Changed icon for Report
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, // Set current index
        onTap: _onItemTapped, // Function to call when tapped
      ),
    );
  }

  // Function to handle bottom navigation bar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  // Build the home content
Widget _buildHomeContent() {
  final screenWidth = MediaQuery.of(context).size.width;

  return SingleChildScrollView(
    child: SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Name
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Fit Wit',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF3C3939),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // Limb and Area Specific Exercises Title
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Limb and Area Specific Exercises',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF3C3939),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.7,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // Exercise Routine Options (First Set)
          _buildExerciseOptionWithNavigation(context, UpperOne(), 'Upper Body'),
          _buildExerciseOptionWithNavigation(context, LowerOne(), 'Lower Body'),
          _buildExerciseOptionWithNavigation(context, CoreOne(), 'Core'),
          _buildExerciseOptionWithNavigation(context, BackOne(), 'Back'),
          _buildExerciseOptionWithNavigation(context, ShoulderOne(), 'Shoulders'),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          // Mixed Routine Title
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Mixed Routine Options',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFF3C3939),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.7,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // Mixed Routine Options (Second Set)
          _buildExerciseOptionWithNavigation(context, UpperBodyCoreOne(), 'Upper Body & Core'),
          _buildExerciseOptionWithNavigation(context, UpperBodyBackOne(), 'Upper Body & Back'),
          _buildExerciseOptionWithNavigation(context, CoreLowerBodyOne(), 'Core & Lower Body'),
          _buildExerciseOptionWithNavigation(context, FullBodySeatedOne(), 'Full Body (Seated)'),

          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    ),
  );
}


  // Build other content for Report and Profile
  Widget _buildOtherContent() {
    switch (_selectedIndex) {
      case 1:
        return ReportScreen(); // Report screen content
      case 2:
        return const ProfileScreen(); // Profile screen content
      default:
        return Container(); // Default case (shouldn't happen)
    }
  }

  // Helper function to build each exercise option
  Widget _buildExerciseOptionWithNavigation(
    BuildContext context, Widget destination, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(
              Icons.fitness_center,
              color: const Color(0xFF3C3939),
              size: 24,
            ),
            SizedBox(width: 16.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF3C3939),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
