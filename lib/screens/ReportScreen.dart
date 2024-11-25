import 'package:flutter/material.dart';
import 'ExerciseHistory.dart';

class ReportScreen extends StatefulWidget {
  @override
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {
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
                  'Fit Vit',
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

             Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Fitness Report',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xFF3C3939),
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Time Graph',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 39, 38, 38),
                    fontSize: MediaQuery.of(context).size.width * 0.020,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Graph- time each davs day. line graph for how many hours of practice for each day. 
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
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Bravo!! Your total number of exercie are: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 39, 38, 38),
                    fontSize: MediaQuery.of(context).size.width * 0.020,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //Total numbers of hours of exercise

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '70Hrs',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 142, 0, 155),
                    fontSize: MediaQuery.of(context).size.width * 0.020,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExerciseHistory()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Exercise History >>',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 39, 38, 38),
                        fontSize: MediaQuery.of(context).size.width * 0.020,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
