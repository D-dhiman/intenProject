import 'package:flutter/material.dart';
import 'QuestionsFour.dart';


class QuestionsThree extends StatefulWidget {
  @override
   QuestionsThreeState createState() => QuestionsThreeState();
}

class QuestionsThreeState extends State<QuestionsThree> {
  String? _selectedLevel;

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      _selectedLevel = level;
    });
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsFour()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the full-screen height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title text
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'What type of disability do you have?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.36,
                ),
              ),
            ),
            // Fitness level options
            _buildOption('Physical', screenWidth),
            SizedBox(height: 20),
            _buildOption('Sensory', screenWidth),
            SizedBox(height: 20),
            _buildOption('Other', screenWidth),
            SizedBox(height: 40),
            // Skip button
            GestureDetector(
              onTap: () {
                // Optionally navigate to another screen without selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionsFour()),
                );
              },
              child: Text(
                'Skip >',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 14,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build each option
  Widget _buildOption(String level, double screenWidth) {
    return GestureDetector(
      onTap: () => _onSelect(level),
      child: Container(
        width: screenWidth * 0.8, // Responsive width
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF5A086A), width: 1),
          borderRadius: BorderRadius.circular(10),
          color: _selectedLevel == level ? Color(0xFF5A086A).withOpacity(0.1) : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          level,
          style: TextStyle(
            color: Color(0xFF5A086A),
            fontSize: 16,
            fontFamily: 'Alexandria',
            fontWeight: FontWeight.w400,
            letterSpacing: 1.12,
          ),
        ),
      ),
    );
  }
}

// Next screen to show after selection
