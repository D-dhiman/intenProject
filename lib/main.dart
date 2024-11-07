import 'package:flutter/material.dart';
import 'screens/SignUpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: Container(
            width: double.infinity, // Ensure container takes full width
            height: double.infinity, // Ensure container takes full height
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFFA000D8), Color(0xFFE021E4)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center content vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center content horizontally
                children: [
                  // FitVit text
                  SizedBox(height: 230),
                  SizedBox(
                    // Like a div element
                    width: 71,
                    height: 92,
                    child: Text(
                      'Fit\nviT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Karantina',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 3.60,
                      ),
                    ),
                  ),

                  SizedBox(height: 130),
                  // Extra text
                  SizedBox(
                    width: double.infinity, // Make sure text is aligned in full width
                    height: 31,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Start your fitness \njourney ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 1.26,
                            ),
                          ),
                          TextSpan(
                            text: 'Today',
                            style: TextStyle(
                              color: Color(0xFFFFC600),
                              fontSize: 14,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w800,
                              height: 0,
                              letterSpacing: 1.26,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 30),
                  // Button start now
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Container(
                      width: 140,
                      height: 37,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Start Now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 94, 1, 89),
                            fontSize: 16,
                            fontFamily: 'Karla',
                            fontWeight: FontWeight.w500,
                            height: 0,
                            letterSpacing: 1.60,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
