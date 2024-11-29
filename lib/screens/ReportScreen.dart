import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Name
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.03),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    'Fit Wit',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color(0xFF3C3939),
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Fitness Report Title
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    'Fitness Report',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color(0xFF3C3939),
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Time Graph Title
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    'Time Graph',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 39, 38, 38),
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Time Graph Image
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.4,
                  child: Image.asset(
                    'assets/time_graph_line.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Bravo Text
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    'Bravo!! Your total number of exercises are:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 39, 38, 38),
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Total Hours
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    '70 Hrs',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 142, 0, 155),
                      fontSize: screenWidth * 0.06, // Responsive font size
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03)
            ],
          ),
        ),
      ),
    );
  }
}
