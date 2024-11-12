import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Exercise.dart';
import 'Rest1.dart';
import '../Completion.dart';

class UpperBodyCoreSix extends StatefulWidget {
  @override
  _UpperBodyCoreSixState createState() => _UpperBodyCoreSixState();
}

class _UpperBodyCoreSixState extends State<UpperBodyCoreSix> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String exerciseName;
  late String exerciseDescription;
  late String exerciseImage;
  List<dynamic> exercises = [];
  int currentExerciseIndex = 0;
  bool isLoading = true;

  Future<void> fetchExerciseData() async {
    try {
      final url = Uri.parse('http://localhost:3000/exercises/upperBodyBack/six');
      final response = await http.get(url, headers: {'Content-Type': 'application/json; charset=UTF-8'});

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

  void updateExerciseDetails() {
    var currentExercise = exercises[currentExerciseIndex];
    exerciseName = currentExercise['name'];
    exerciseDescription = currentExercise['desc'];
    exerciseImage = currentExercise['image'];
  }

  void startExerciseTimer() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 25),
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToRestScreen();
      }
    });
  }

  void navigateToRestScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestCard()),
    );
  }

  void skipToCompletionScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CompletionScreen()),
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
            onPressed: skipToCompletionScreen,
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
          onSkip: skipToCompletionScreen,
        ),
      ),
    );
  }
}
