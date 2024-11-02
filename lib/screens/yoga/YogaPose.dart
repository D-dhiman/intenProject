import 'package:flutter/material.dart';
import 'dart:async';

class YogaRoutine {
  final String name;
  final String description;
  final String mediaPath; // Path to image/video
  final String disabilityType;
  final String difficulty;

  YogaRoutine(this.name, this.description, this.mediaPath, this.disabilityType, this.difficulty);
}

// Sample yoga routine list
List<YogaRoutine> allYogaRoutines = [
  YogaRoutine('Seated Breathing', 'Focus on breathing...', 'assets/seated_breathing.png', 'mobility', 'easy'),
  YogaRoutine('Chair Twist', 'Gentle twist seated on a chair...', 'assets/chair_twist.png', 'mobility', 'easy'),
  YogaRoutine('Gentle Stretch', 'A gentle stretch routine...', 'assets/gentle_stretch.png', 'flexibility', 'medium'),
  YogaRoutine('Wall Yoga', 'Yoga poses using a wall for support...', 'assets/wall_yoga.png', 'mobility', 'easy'),
  // Add more routines with different tags
];

// Function to filter routines based on disability type
List<YogaRoutine> getPersonalizedRoutines(String disabilityType) {
  return allYogaRoutines.where((routine) => routine.disabilityType == disabilityType).toList();
}

class YogaPose extends StatelessWidget {
  final List<YogaRoutine> routines;

  YogaPose({required this.routines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Routine'),
      ),
      body: routines.isNotEmpty
          ? ExerciseScreen(exercise: routines[0], exerciseIndex: 0, routines: routines)
          : Center(child: Text('No routines available for this disability type.')),
    );
  }
}

class ExerciseScreen extends StatefulWidget {
  final YogaRoutine exercise;
  final int exerciseIndex;
  final List<YogaRoutine> routines;

  ExerciseScreen({required this.exercise, required this.exerciseIndex, required this.routines});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late Timer _restTimer;
  int _restDuration = 5; // Rest duration in seconds
  bool _isResting = false;

  void _startRestTimer() {
    setState(() {
      _isResting = true;
    });
    _restTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_restDuration > 0) {
        setState(() {
          _restDuration--;
        });
      } else {
        _restTimer.cancel();
        _navigateToNextExercise();
      }
    });
  }

  void _navigateToNextExercise() {
    if (widget.exerciseIndex + 1 < widget.routines.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ExerciseScreen(
            exercise: widget.routines[widget.exerciseIndex + 1],
            exerciseIndex: widget.exerciseIndex + 1,
            routines: widget.routines,
          ),
        ),
      );
    } else {
      Navigator.pop(context); // or navigate to a completion screen
    }
  }

  @override
  void initState() {
    super.initState();
    _startRestTimer(); // Start the rest timer when the screen initializes
  }

  @override
  void dispose() {
    _restTimer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isResting
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rest for $_restDuration seconds',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(), // Optional progress indicator
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.exercise.name, style: TextStyle(fontSize: 24)),
                SizedBox(height: 10),
                Image.asset(widget.exercise.mediaPath), // Exercise image
                SizedBox(height: 10),
                Text(widget.exercise.description),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _startRestTimer(); // Start rest when exercise is completed
                  },
                  child: Text('Complete Exercise'),
                ),
              ],
            ),
    );
  }
}

// Main function to run the app
void main() {
  runApp(MaterialApp(
    home: DisabilitySelectionScreen(),
  ));
}

class DisabilitySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Disability Type'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                List<YogaRoutine> routines = getPersonalizedRoutines('mobility');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaPose(routines: routines)),
                );
              },
              child: Text('Mobility'),
            ),
            ElevatedButton(
              onPressed: () {
                List<YogaRoutine> routines = getPersonalizedRoutines('flexibility');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YogaPose(routines: routines)),
                );
              },
              child: Text('Flexibility'),
            ),
            // Add more buttons for different disability types as needed
          ],
        ),
      ),
    );
  }
}
