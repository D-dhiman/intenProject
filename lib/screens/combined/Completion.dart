import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:my_flutter_app/screens/Home.dart'; // Update this import path based on your project structure

class CompletionScreen extends StatefulWidget {
  @override
  _CompletionScreenState createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  late ConfettiController _confettiControllerTop;
  late ConfettiController _confettiControllerBottom;

  @override
  void initState() {
    super.initState();
    _confettiControllerTop = ConfettiController(duration: const Duration(seconds: 2));
    _confettiControllerBottom = ConfettiController(duration: const Duration(seconds: 2));

    // Start the confetti animation
    _confettiControllerTop.play();
    _confettiControllerBottom.play();

    // Navigate to Home after the confetti animation ends (2 seconds delay)
    Future.delayed(Duration(seconds: 6), navigateToHome);
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()), // Navigate to Home screen
    );
  }

  @override
  void dispose() {
    _confettiControllerTop.dispose();
    _confettiControllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top confetti widget
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiControllerTop,
                    blastDirection: 3.14 / 2,
                    emissionFrequency: 0.05,
                    numberOfParticles: 10,
                    gravity: 0.1,
                    colors: [const Color.fromARGB(255, 195, 0, 230),
                             const Color.fromARGB(255, 253, 5, 88),
                             const Color.fromARGB(255, 0, 140, 255),
                             const Color.fromARGB(255, 226, 222, 0)],
                  ),
                ),
                
                // Congratulatory text
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: Text(
                      'Congratulations!!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 183, 0, 255),
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.68,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                
                // Description text
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text(
                      'All Exercises Completed!!',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 108, 0, 117),
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                
                // Bottom confetti widget
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ConfettiWidget(
                    confettiController: _confettiControllerBottom,
                    blastDirection: -3.14 / 2,
                    emissionFrequency: 0.05,
                    numberOfParticles: 10,
                    gravity: 0.1,
                    colors: [const Color.fromARGB(255, 217, 0, 255),
                             const Color.fromARGB(255, 255, 1, 86),
                             const Color.fromARGB(255, 1, 141, 255),
                             const Color.fromARGB(255, 255, 238, 0)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
