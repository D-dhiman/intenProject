import 'package:flutter/material.dart';
import 'upperBodyCoreTwo.dart'; // Import the next screen for post-rest navigation

class RestCard extends StatefulWidget {
  @override
  _RestCardState createState() => _RestCardState();
}

class _RestCardState extends State<RestCard> with SingleTickerProviderStateMixin {
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
      MaterialPageRoute(builder: (context) => UpperBodyCoreTwo()), // Next screen after rest
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
        title: Text("Rest"),
        actions: [
          TextButton(
            onPressed: skipRestAndGoToNextScreen,
            child: Text(
              "Skip",
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rest',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CircularProgressIndicator(value: _controller.value),
          ],
        ),
      ),
    );
  }
}
