import 'package:flutter/material.dart';
import 'SecondS.dart';
import 'Start.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIGN UP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBD0FDE),
                  fontSize: 26,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.30,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Username / Email ID',
                style: TextStyle(
                  color: Color(0xFF3C3939),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.65,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xC9E0E0E0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0x66BB0EDD),
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color(0xFF7C7979),
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF3C3939),
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.65,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true, // to hide password input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xC9E0E0E0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0x66BB0EDD),
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFF7C7979),
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 140,
                height: 37,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    backgroundColor: Color(0xFFBD0FDE),
                  ),
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    print('Username: $username');
                    print('Password: $password');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Start()),
                    );
                  },
                  child: Text(
                    'Start Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.60,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondS()),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account',
                        style: TextStyle(
                          color: Color(0xFF5A086A),
                          fontSize: 14,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.84,
                        ),
                      ),
                      TextSpan(
                        text: ' \nLogin now!',
                        style: TextStyle(
                          color: Color(0xFF5A086A),
                          fontSize: 14,
                          fontFamily: 'Karla',
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          letterSpacing: -0.84,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
