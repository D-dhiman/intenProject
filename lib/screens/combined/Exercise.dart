import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImage;
  final String exerciseDescription;
  final AnimationController controller;
  final Function onSkip;

  ExerciseCard({
    required this.exerciseName,
    required this.exerciseImage,
    required this.exerciseDescription,
    required this.controller,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Exercise title
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                exerciseName,
                style: TextStyle(
                  color: Colors.black,
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

          // Exercise description
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                exerciseDescription,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),

          // Exercise image
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
              ),
              child: Image.asset(
                exerciseImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Animated progress bar timer
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: controller.value, // Progress from 0.0 to 1.0
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00A3FF)),
                );
              },
            ),
          ),

          // Skip button
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
              child: GestureDetector(
                onTap: () => onSkip(),
                child: Text(
                  'Skip >',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF616161),
                    fontSize: 14,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
