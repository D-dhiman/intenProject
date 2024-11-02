import 'package:flutter/material.dart';
import 'dart:async';
import 'YogaPose.dart';

class YogaStart extends StatefulWidget {
  @override
  YogaStartState createState() => YogaStartState();
}

class YogaStartState extends State<YogaStart> {
  String disabilityType = 'mobility';

  int _counter = 3; // Countdown starting value
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        navigateToNextScreen();
      }
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => YogaPose(disabilityType:disabilityType)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Full width of the screen
        height: MediaQuery.of(context).size.height, // Full height of the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Let’s \nStart',
                style: TextStyle(
                  color: Color(0xFFBB0EDD),
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15), // Space between text and gradient line

            // Gradient line
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.0, 0.0),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFF890CA2),
                    Color(0xFFC77BD6),
                    Color(0xFF890CA2)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Adds spacing to push bottom elements down
            Container(
              alignment: Alignment.center,
              child: Text(
                'Starting In',
                style: TextStyle(
                  color: Color(0xFFBB0EDD),
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: TweenAnimationBuilder<int>(
                tween: IntTween(begin: _counter, end: 0),
                duration: Duration(seconds: _counter),
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 60,
                      color: const Color.fromARGB(255, 255, 154, 2),
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                onEnd: navigateToNextScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
