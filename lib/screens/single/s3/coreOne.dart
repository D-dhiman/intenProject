import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Exercise.dart';
import 'Rest1.dart';
import 'coreTwo.dart'; // Import the next screen file

class CoreOne extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<CoreOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String exerciseName;
  late String exerciseDescription;
  late String exerciseImage;
  List<dynamic> exercises = [];
  int currentExerciseIndex = 0;
  bool isLoading = true; // Track if data is still loading

  // Fetch exercise data
  Future<void> fetchExerciseData() async {
    try {
      final url =
          Uri.parse('http://localhost:3000/single/core/one');
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          exercises = [data];
          if (exercises.isNotEmpty) {
            updateExerciseDetails();
            isLoading = false;
            startExerciseTimer();
          } else {
            isLoading = false;
          }
        });
      } else {
        throw Exception('Failed to load exercise data');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Update exercise details from the current index
  void updateExerciseDetails() {
    var currentExercise = exercises[currentExerciseIndex];
    exerciseName = currentExercise['name'];
    exerciseDescription = currentExercise['desc'];
    exerciseImage = currentExercise['image'];
  }

  // Start the exercise timer
  void startExerciseTimer() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 25), // Exercise duration
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToRestScreen();
      }
    });
  }

  // Navigate to the rest screen
  void navigateToRestScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestCard()),
    );
  }

  // Skip directly to the next screen, bypassing rest
  void skipToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CoreTwo()),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchExerciseData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (exercises.isEmpty) {
      return Scaffold(
        body: Center(child: Text('No exercises available.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise"),
        actions: [
          TextButton(
            onPressed: skipToNextScreen,
            child: Text(
              "Skip",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: ExerciseCard(
          exerciseName: exerciseName,
          exerciseImage: exerciseImage,
          exerciseDescription: exerciseDescription,
          controller: _controller,
          onSkip: skipToNextScreen, // Pass the skip function here
        ),
      ),
    );
  }
}
