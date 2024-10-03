import 'package:flutter/material.dart';

class SecondS extends StatefulWidget {
  @override
  _SecondSState createState() => _SecondSState();
}

class _SecondSState extends State<SecondS> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: Container(
            width: double.infinity, // Full width
            height: double.infinity, // Full height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0), // Padding for inner content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50), // Adjust top spacing
                  Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFBD0FDE),
                      fontSize: 28,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.40,
                    ),
                  ),
                  SizedBox(height: 30), // Spacing between title and fields
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xC9E0E0E0),
                      hintText: 'Username / Email ID',
                      hintStyle: TextStyle(
                        color: Color(0xFF7C7979),
                        fontSize: 12,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0x66BB0EDD),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Spacing between fields
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xC9E0E0E0),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xFF7C7979),
                        fontSize: 12,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0x66BB0EDD),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Spacing after fields
                  Text(
                    'Login using',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.36,
                    ),
                  ),
                  SizedBox(height: 10), // Spacing before social login icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Replace with actual images or icons
                      Container(
                        width: 18,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/google.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Space between icons
                      Container(
                        width: 35,
                        height: 23,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/facebook.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Space before login button
                  ElevatedButton(
                    onPressed: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      print('Username: $username');
                      print('Password: $password');
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
