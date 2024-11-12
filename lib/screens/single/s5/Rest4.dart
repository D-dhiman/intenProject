import 'package:flutter/material.dart';
import 'shoulderFive.dart'; // Import the next screen for post-rest navigation

class Rest4 extends StatefulWidget {
  @override
  _RestCardState createState() => _RestCardState();
}

class _RestCardState extends State<Rest4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    startRestTimer();
  }

  // Start the rest timer and navigate to the next screen after completion
  void startRestTimer() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Rest period duration
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToNextScreen();
      }
    });
  }

  // Navigate directly to the next screen after rest
  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ShoulderFive()), // Next screen after rest
    );
  }

  // Skip rest and go directly to the next screen
  void skipRestAndGoToNextScreen() {
    _controller.stop(); // Stop the timer
    navigateToNextScreen(); // Navigate to the next screen
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar color to white
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rest',
              style: TextStyle(
                color: const Color.fromARGB(255, 140, 0, 255),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: 'Karla',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.7,
              ),
            ),
            //snoopy gif
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
              child: Container(
                //width: MediaQuery.of(context).size.width * 0.3,
                //height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
                child: Image.asset(
                  'assets/restGif.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //timer bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
              child: AnimatedBuilder(
                animation:_controller,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _controller.value, // Progress from 0.0 to 1.0
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00A3FF)),
                  );
                },
              ),
            ),
            //skip button
            Spacer(), // Push the button to the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Add some bottom padding
              child: TextButton(
                onPressed: skipRestAndGoToNextScreen,
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            CircularProgressIndicator(value: _controller.value),
          ],
        ),
      ),
    );
  }
}

