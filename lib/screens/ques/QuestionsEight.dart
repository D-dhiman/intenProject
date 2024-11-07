import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;// Import the http package
import 'dart:convert'; // Import for JSON encoding
import 'QuestionsNine.dart';

class QuestionsEight extends StatefulWidget {
  const QuestionsEight({super.key});

  @override
  QuestionsEightState createState() => QuestionsEightState();
}

class QuestionsEightState extends State<QuestionsEight> {
  String? motivationalMessages;

  // Function to handle selection and navigation
  void _onSelect(String level) {
    setState(() {
      motivationalMessages = level;
    });
    // Send data to the backend
    _sendDataToBackend(level);
    
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsNine()),
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
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Would you like to receive motivational messages?',
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
            // Options for motivational messages
            _buildOption('Yes, daily', screenWidth),
            const SizedBox(height: 20),
            _buildOption('Yes, weekly', screenWidth),
            const SizedBox(height: 20),
            _buildOption('No', screenWidth),
            const SizedBox(height: 40),
            // Skip button
            GestureDetector(
              onTap: () {
                // Optionally navigate to another screen without selection
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionsNine()),
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
          color: motivationalMessages == level ? const Color(0xFF5A086A).withOpacity(0.1) : Colors.transparent,
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
    final url = Uri.parse('http://localhost:3000/api/motivational-messages'); // Update this URL
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'motivationalMessages': selection}), // Sending user selection
      );

      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
      } else {
        print('Failed to send motivational-messages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending motivational-messages: $e');
    }
  }
}
