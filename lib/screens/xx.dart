import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';
import 'Start.dart';
import 'Home.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Ensure form is validated
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://yourbackendapi.com/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Start()),
        );
      } else {
        // Handle error
        print('Signup failed');
      }
    }
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
              const Text(
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
              const SizedBox(height: 30),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  labelStyle: const TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.65,
                  ),
                  filled: true,
                  fillColor: const Color(0xC9E0E0E0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x66BB0EDD),
                    ),
                  ),
                ),
                validator: (value) {
                  return (value == null || value.isEmpty) ? 'Please enter your email ID' : null;
                },
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC9E0E0E0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x66BB0EDD),
                      ),
                    ),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Color(0xFF7C7979),
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // hides the password input
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Color(0xFF3C3939),
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Karla',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.65,
                  ),
                  filled: true,
                  fillColor: const Color(0xC9E0E0E0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0x66BB0EDD),
                    ),
                  ),
                ),
                validator: (value) {
                  return (value == null || value.isEmpty) ? 'Please enter your password' : null;
                },
              ),

              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true, // to hide password input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xC9E0E0E0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0x66BB0EDD),
                      ),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color(0xFF7C7979),
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 140,
                height: 37,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    backgroundColor: const Color(0xFFBD0FDE),
                  ),
                  onPressed: _signUp,
                  child: const Text(
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text.rich(
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




















class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  const SizedBox(height: 50), // Adjust top spacing
                  const Text(
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
                  const SizedBox(height: 30), // Spacing between title and fields
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xC9E0E0E0),
                      hintText: 'Username / Email ID',
                      hintStyle: const TextStyle(
                        color: Color(0xFF7C7979),
                        fontSize: 12,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0x66BB0EDD),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between fields
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xC9E0E0E0),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xFF7C7979),
                        fontSize: 12,
                        fontFamily: 'Karla',
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color(0x66BB0EDD),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Spacing after fields
                  const Text(
                    'Login using',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.36,
                    ),
                  ),
                  const SizedBox(height: 10), // Spacing before social login icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Replace with actual images or icons
                      Container(
                        width: 18,
                        height: 20,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/google.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20), // Space between icons
                      Container(
                        width: 35,
                        height: 23,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/facebook.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // Space before login button
                  ElevatedButton(
                    onPressed: () {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      print('Username: $username');
                      print('Password: $password');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text('Login'),
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
