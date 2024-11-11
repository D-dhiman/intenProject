import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Login.dart';
import 'Start.dart';




class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

Future<void> _signUp() async {
  final String username = _usernameController.text;
  final String email = _emailController.text;
  final String password = _passwordController.text;

  if (_formKey.currentState!.validate()) {
    final response = await http.post(
      Uri.parse('http://localhost:3000/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Navigate to the next screen or display success message
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Start()),
      );
    } else {
      // Display error message from the response
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String errorMessage = responseData['message'];

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Form(
          key: _formKey,
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
                  style: TextStyle(
                    color: Color(0xFFBD0FDE),
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.30,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'email'),
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter your email'
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'username'),
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter your email'
                        : null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please enter your password'
                        : null;
                  },
                ),
                const SizedBox(height: 30),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      backgroundColor: const Color(0xFFBD0FDE),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
                            letterSpacing: -0.84,
                          ),
                        ),
                        TextSpan(
                          text: ' \nLogin now!',
                          style: TextStyle(
                            color: Color(0xFF5A086A),
                            fontSize: 14,
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
      ),
    );
  }
}