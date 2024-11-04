import 'package:flutter/material.dart';
import 'QuestionsEight.dart';
import 'Global.dart';

class QuestionsSeven extends StatefulWidget {
  @override
  QuestionsSevenState createState() => QuestionsSevenState();
}

class QuestionsSevenState extends State<QuestionsSeven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100), // Add spacing from the top
            Text(
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
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xC9D9D9D9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Color(0xFF5A086A),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
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
            SizedBox(height: 30), // Add spacing below the input field
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen and pass userInput
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsEight(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5A086A), // Button color
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.40,
                ),
              ),
            ),
            SizedBox(height: 10), // Spacing between Submit and Skip buttons
            TextButton(
              onPressed: () {
                // Navigate to the next screen and pass userInput
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsEight(),
                  ),
                );
              },
              child: Text(
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
}
