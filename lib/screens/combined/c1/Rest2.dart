import 'package:flutter/material.dart';

class Rest2 extends StatefulWidget {
  const Rest2({super.key});

  @override
  _Rest2State createState() => _Rest2State();
}

class _Rest2State extends State<Rest2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int restDuration; // Duration for the rest period (in seconds)

  @override
  void initState() {
    super.initState();
    restDuration = 10; // Set the rest period to 10 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: restDuration),
    );
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Move to the next screen after the rest period is over
        Navigator.pop(context); // Go back to the previous screen (UpperBodyCoreTwo)
      }
    });
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
        title: const Text('Rest Period'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rest Time',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '${_controller.value * restDuration}', // Show remaining time as a countdown
              style: const TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Skip rest and move to the next exercise
                Navigator.pop(context); // Go back to UpperBodyCoreTwo and move to next exercise
              },
              child: const Text('Skip Rest'),
            ),
          ],
        ),
      ),
    );
  }
}
