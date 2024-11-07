import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  ReportScreenState createState() => ReportScreenState();
}

class ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text(
        'Profile',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.04,
        ),
      ),
    );
  }
}
