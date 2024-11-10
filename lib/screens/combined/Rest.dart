import 'package:flutter/material.dart';

class RestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // GIF for rest
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
            child: Image.asset('assets/restGif.gif'), // The rest GIF
          ),
          Text(
            'Rest',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          LinearProgressIndicator(), // Rest timer progress
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: () {
                // Skip rest period
                Navigator.of(context).pop(); // Or any other method to move to the next exercise
              },
              child: Text('Skip >'),
            ),
          ),
        ],
      ),
    );
  }
}
