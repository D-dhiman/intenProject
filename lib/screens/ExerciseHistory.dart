import 'package:flutter/material.dart';

class ExerciseHistory extends StatefulWidget {
  @override
  ExerciseHistoryState createState() => ExerciseHistoryState();
}

class ExerciseHistoryState extends State<ExerciseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        child:SingleChildScrollView(
          child:Column(
            children: [
              Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Exercise History',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // list of all the pervious exercise plans a person has used. 

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/customise.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/customise.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/customise.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.asset(
                  'assets/customise.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            
            ],
          ),
        ),
      ),
    );
  }
}
