import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON encoding
import 'QuestionsThree.dart';

class QuestionsTwo extends StatefulWidget {
  const QuestionsTwo({super.key});

  @override
  QuestionsTwoState createState() => QuestionsTwoState();
}

class QuestionsTwoState extends State<QuestionsTwo> {
  String? goal;

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      goal = level;
    });
    // Send data to the backend
    _sendDataToBackend(level);
    
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionsThree()),
    );
  }

  Future<void> _sendDataToBackend(String level) async {
    final url = Uri.parse('http://localhost:3000/api/fitness-goal'); // Update this URL
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'goal': level}), // Sending selected goal
      );

      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
      } else {
        print('Failed to send fitness-goal: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending fitness-goal: $e');
    }
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
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'What is your primary fitness goal?',
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
            _buildOption('Improve Mobility', screenWidth),
            const SizedBox(height: 10),
            _buildOption('Build Strength', screenWidth),
            const SizedBox(height: 10),
            _buildOption('Increase Endurance', screenWidth),
            const SizedBox(height: 10),
            _buildOption('Weight Management', screenWidth),
            const SizedBox(height: 30),
            // Skip button
            GestureDetector(
              onTap: () {
                // Optionally navigate to another screen without selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionsThree()),
                );
              },
              child: const Text(
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
          border: Border.all(color: const Color(0xFF5A086A), width: 1),
          borderRadius: BorderRadius.circular(10),
          color: goal == level ? const Color(0xFF5A086A).withOpacity(0.1) : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          level,
          style: const TextStyle(
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
