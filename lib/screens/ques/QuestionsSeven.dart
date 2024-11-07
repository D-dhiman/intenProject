import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON encoding
import 'QuestionsEight.dart';

class QuestionsSeven extends StatefulWidget {
  const QuestionsSeven({super.key});

  @override
  QuestionsSevenState createState() => QuestionsSevenState();
}

class QuestionsSevenState extends State<QuestionsSeven> {
  String restrictions = ""; // To store the input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Add spacing from the top
            const Text(
              'Do you have any specific fitness challenges or restrictions we should consider?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w400,
                letterSpacing: 1.36,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xC9D9D9D9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFF5A086A),
                ),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your specification here',
                  hintStyle: TextStyle(
                    color: Color(0xFF5A086A),
                    fontSize: 11,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.88,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    restrictions = value; // Storing the input
                  });
                },
              ),
            ),
            const SizedBox(height: 30), // Add spacing below the input field
            TextButton(
              onPressed: () {
                // Send data to the backend before navigating
                _sendDataToBackend(restrictions);
                
                // Navigate to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsEight(),
                  ),
                );
              },
              child: const Text(
                'Skip >',
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

  Future<void> _sendDataToBackend(String input) async {
    final url = Uri.parse('http://localhost:3000/api/restrictions'); // Update this URL
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({'restrictions': input}), // Sending user input
      );

      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
      } else {
        print('Failed to send restrictions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending restrictions: $e');
    }
  }
}
