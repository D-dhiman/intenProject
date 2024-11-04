import 'package:flutter/material.dart';
import 'QuestionsFour.dart';
import 'Global.dart';


class QuestionsThree extends StatefulWidget {
  @override
   QuestionsThreeState createState() => QuestionsThreeState();
}

class QuestionsThreeState extends State<QuestionsThree> {

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      disabillity = level;
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
          color: disabillity == level ? Color(0xFF5A086A).withOpacity(0.1) : Colors.transparent,
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
