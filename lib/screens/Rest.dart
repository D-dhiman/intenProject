import 'package:flutter/material.dart';

class RestCard extends StatefulWidget {
  @override
  RestCardState createState() => RestCardState();
}

class RestCardState extends State<RestCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 25 seconds
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller to free resources
    _controller.dispose();
    super.dispose();
  }

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
          // GIF
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child:Image.asset(
                'restGif.gif',
              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                'REST',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.68,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          // Animated progress bar timer
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: _controller.value, // Progress from 0.0 to 1.0
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00A3FF)),
                );
              },
            ),
          ),

          // Skip text
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
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
        ],
      ),
    );
  }
}