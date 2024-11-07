import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {

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
