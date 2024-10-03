import 'package:flutter/material.dart';
import 'QuestionsOne.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: Text(
                  'Hello Username !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    height: 1.2, // Adjust spacing between lines
                    letterSpacing: 1.60,
                  ),
                ),
              ),
              // Adds space between "Hello" text and the questions text
              SizedBox(
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Here are some questions to tailor a ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: 'personalized plan',
                        style: TextStyle(
                          color: Color(0xFF890CA2),
                          fontSize: 15,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.50,
                        ),
                      ),
                      TextSpan(
                        text: ' for you.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.50,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left, // Align text to the left
                ),
              ),
              Spacer(),
              // Pushes the button to the bottom

              GestureDetector(
                onTap: () {
                  // Add functionality here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionsOne()),
                  );
                },
                child: Container(
                  width: 140,
                  height: 37,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 102, 2, 105),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
