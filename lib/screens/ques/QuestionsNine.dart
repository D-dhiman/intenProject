import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON encoding
import '../Home.dart'; // Import the Home screen
import '../SignupScreen.dart'; // Import the Signup screen

class QuestionsNine extends StatefulWidget {
  const QuestionsNine({super.key});

  @override
  QuestionsNineState createState() => QuestionsNineState();
}

class QuestionsNineState extends State<QuestionsNine> {
  String? communityChallenge;

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      communityChallenge = level;
    });
    // Send data to the backend
    _sendDataToBackend(level);
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
                'Do you prefer group/community challenges?',
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
            // Options for community challenges
            _buildOption('No', screenWidth),
            const SizedBox(height: 30),
            _buildOption('Yes', screenWidth),
            const SizedBox(height: 50),
            // Skip button
            GestureDetector(
              onTap: () {
                // Optionally navigate to another screen without selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
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
          color: communityChallenge == level ? const Color(0xFF5A086A).withOpacity(0.1) : Colors.transparent,
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

  Future<void> _sendDataToBackend(String selection) async {
    final url = Uri.parse('http://localhost:3000/api/community-challenges'); // Update this URL
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'communityChallenge': selection}), // Sending user selection
      );

      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
        // Navigate to Home screen after successful data submission
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      } else {
        // If there's an error response from the backend
        print('Failed to send community challenges: ${response.statusCode}');
        _showErrorSnackbar('Failed to send data: ${response.body}');
        _navigateToSignup();
      }
    } catch (e) {
      print('Error sending community challenges: ${e.message}');
      _showErrorSnackbar('Error sending data: ${e.message}');
      _navigateToSignup();
    }
  }

  // Function to show error message as Snackbar
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), // Duration of the snackbar
        backgroundColor: Colors.red, // Background color
      ),
    );
  }

  // Navigate to the signup screen
  void _navigateToSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }
}

extension on Object {
  get message => null;
}
