import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // For JSON encoding/decoding
import 'QuestionsTwo.dart';

class QuestionsOne extends StatefulWidget {
  const QuestionsOne({super.key});

  @override
  QuestionsOneState createState() => QuestionsOneState();
}

class QuestionsOneState extends State<QuestionsOne> {
  String? fitnessLevel;

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      fitnessLevel = level;
    });

    // Send selected fitness level to the backend
    _sendFitnessLevelToBackend(level);

    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuestionsTwo()), // Pass selected level
    );
  }

  // Function to send selected fitness level to the backend
  Future<void> _sendFitnessLevelToBackend(String level) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/api/fitness-level'), // Update with your backend URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'fitnessLevel': level, // Send the fitness level
        }),
      );

      if (response.statusCode == 200) {
        print('Fitness level sent successfully: ${response.body}');
      } else {
        print('Failed to send fitness level: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending fitness level: $e');
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
                'What is your current fitness level?',
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
            _buildOption('Beginner', screenWidth),
            const SizedBox(height: 20),
            _buildOption('Intermediate', screenWidth),
            const SizedBox(height: 20),
            _buildOption('Advanced', screenWidth),
            const SizedBox(height: 40),
            // Skip button
            GestureDetector(
              onTap: () {
                // Optionally navigate to another screen without selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionsTwo()),
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
          color: fitnessLevel == level
              ? const Color(0xFF5A086A).withOpacity(0.1)
              : Colors.transparent,
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
