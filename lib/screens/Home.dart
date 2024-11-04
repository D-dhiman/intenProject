import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'ReportScreen.dart';

class Home extends StatefulWidget {
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
      child: Container(
        width: screenWidth,
        child: Column(
          children: [
            // App Name
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'App Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            // Week Goals
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Week Goals',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Customize your exercise routine text
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/customise.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Limb and Area Specific Exercises
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Limb and Area Specific Exercises',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Exercise routine options
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildExerciseOption(null),
                    SizedBox(width: 8),
                    _buildExerciseOption(null),
                    SizedBox(width: 8),
                    _buildExerciseOption(null),
                    SizedBox(width: 8),
                    _buildExerciseOption(null),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // More options
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'More options',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Yoga image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.asset(
                    'assets/placeHolder.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            // Zumba image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset(
                  'assets/placeHolder.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
        return ProfileScreen(); // Profile screen content
      default:
        return Container(); // Default case (shouldn't happen)
    }
  }

  // Helper function to build each exercise option
  Widget _buildExerciseOption(String? imageUrl) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: imageUrl == null ? Color(0xFFD9D9D9) : null,
        borderRadius: BorderRadius.circular(8),
        image: imageUrl != null
            ? DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              )
            : null,
      ),
    );
  }
}
