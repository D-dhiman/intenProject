import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Exercise.dart';
import 'Rest1.dart';

class UpperBodyCoreThree extends StatefulWidget {
  const UpperBodyCoreThree({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<UpperBodyCoreThree> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String exerciseName;
  late String exerciseImage;
  late String exerciseDescription;
  List<dynamic> exercises = [];
  int currentExerciseIndex = 0;
  bool isRest = false; // Track if it's rest period or exercise period
  bool isFinished = false; // Track if all exercises are done
  bool isLoading = true;

  // Fetch exercise data
  Future<void> fetchExerciseData() async {
  try {
    final url = Uri.parse('http://localhost:3000/exercises/upperBodyCore/three');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body); // Log the fetched data
      setState(() {
        exercises = data;
        if (exercises.isNotEmpty) {
          exerciseName = exercises[currentExerciseIndex]['name'];
          exerciseImage = exercises[currentExerciseIndex]['image'];
          exerciseDescription = exercises[currentExerciseIndex]['desc'];
          isLoading = false; // Data has loaded
          startTimer();
        } else {
          isFinished = true;
          isLoading = false;
        }
      });
    } else {
      throw Exception('Failed to load exercise data');
    }
  } catch (error) {
    print("Error fetching data: $error"); // Log error
    setState(() {
      isLoading = false;
    });
  }
}

  // Start the timer (for both exercise and rest periods)
  void startTimer() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: isRest ? 10 : 15), // 15 seconds for exercise, 10 for rest
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (isRest) {
            // Move to next exercise after rest
            if (currentExerciseIndex < exercises.length - 1) {
              currentExerciseIndex++;
              isRest = false; // Switch to exercise
              exerciseName = exercises[currentExerciseIndex]['name'];
              exerciseImage = exercises[currentExerciseIndex]['image'];
              exerciseDescription = exercises[currentExerciseIndex]['desc'];
            } else {
              isFinished = true; // End the routine
            }
          } else {
            // Switch to rest after exercise
            isRest = true;
          }
        });

        if (!isFinished) {
          startTimer(); // Restart the timer with the new exercise or rest
        }
      }
    });
  }

  // Initialize state and start the first timer only after data fetch
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
    // Display a loading indicator while data is loading
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (exercises.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('No exercises available.')),
      );
    }

    // Display a completion message when all exercises are finished
    if (isFinished) {
      return const Scaffold(
        body: Center(child: Text('All exercises completed!')),
      );
    }

    return Scaffold(
      body: Center(
        child: isRest 
          ? RestCard() 
          : ExerciseCard(
              exerciseName: exerciseName,
              exerciseImage: exerciseImage,
              exerciseDescription: exerciseDescription,
              controller: _controller,
              onSkip: () {
                setState(() {
                  if (isRest) {
                    // Skip rest and move to next exercise
                    if (currentExerciseIndex < exercises.length - 1) {
                      currentExerciseIndex++;
                      isRest = false;
                      exerciseName = exercises[currentExerciseIndex]['name'];
                      exerciseImage = exercises[currentExerciseIndex]['image'];
                      exerciseDescription = exercises[currentExerciseIndex]['desc'];
                    } else {
                      isFinished = true;
                    }
                  } else {
                    // Skip exercise and move to rest
                    isRest = true;
                  }
                });
                startTimer();
              },
            ),
      ),
    );
  }
}
