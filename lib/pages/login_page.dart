import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/main.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginpage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Define variables to store user input
  String _email = '';
  String _password = '';

  // Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create an instance of SharedPreferences
  SharedPreferences? _prefs;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  void _checkLoginStatus() async {
    bool hasLoggedInToday = await _hasLoggedInToday();
    if (hasLoggedInToday) {
      //redirect to homepage
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }
  }

  // Initialize SharedPreferences instance
  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
                opacity: 0.87,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        _signIn();
                      },
                      child: const Text('Log In'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '''Don't have an account? 🤔''',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignupPage.routeName);
                      },
                      child: const Text(
                        'Tickle me to sign up 😜',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Retrieve and display the saved timestamps
  // void _displaySavedTimestamps() async {
  //   final int? lastLoginTimestamp = await _getLastLoginTimestamp();
  //   if (lastLoginTimestamp != null) {
  //     final DateTime lastLoginDate =
  //         DateTime.fromMillisecondsSinceEpoch(lastLoginTimestamp);
  //     print('Last login timestamp: $lastLoginDate');
  //   } else {
  //     print('No saved timestamps found.');
  //   }
  // }

  // Implement sign in functionality
  void _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      // Handle successful sign in
      // Save the current timestamp to SharedPreferences
      _saveLastLoginTimestamp();
      // _checkLoginStatus();
      _initSharedPreferences();
    } on FirebaseAuthException catch (e) {
      // Handle sign in errors
      // Display an error message or perform any desired action
      String errorMessage = "";
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found. Please check your email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password. Please check your password.';
      } else if (e.code == 'unknown') {
        errorMessage = "You're almost there. Fill in the fields.";
      } else {
        errorMessage = 'Sign in failed. Error: ${e.message}';
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Oops!'),
            content: Text(errorMessage),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        },
      );
    }
  }

  // Save the current timestamp to SharedPreferences
  void _saveLastLoginTimestamp() async {
    const String timestampKey = 'last_login_timestamp';
    final int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    await _prefs?.setInt(timestampKey, currentTimestamp);
  }

  // Retrieve the last login timestamp from SharedPreferences
  Future<int?> _getLastLoginTimestamp() async {
    const String timestampKey = 'last_login_timestamp';
    return _prefs?.getInt(timestampKey);
  }

  // Check if the user has already logged in today based on the last login timestamp
  Future<bool> _hasLoggedInToday() async {
    final int? lastLoginTimestamp = await _getLastLoginTimestamp();
    if (lastLoginTimestamp != null) {
      final DateTime lastLoginDate =
          DateTime.fromMillisecondsSinceEpoch(lastLoginTimestamp);
      final DateTime currentDate = DateTime.now();
      if (lastLoginDate.year == currentDate.year &&
          lastLoginDate.month == currentDate.month &&
          lastLoginDate.day == currentDate.day) {
        return true;
      }
    }
    return false;
  }
}
