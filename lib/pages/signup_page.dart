import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/main.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  static const String routeName = '/signUp';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _reenterPasswordController =
      TextEditingController();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('userDetails');

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Check if password and re-entered password match
      if (_passwordController.text != _reenterPasswordController.text) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Passwords do not match.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        return; // Stop further execution
      }

      try {
        // Check if the user already exists with the provided email
        var existingUser =
            await _auth.fetchSignInMethodsForEmail(_emailController.text);
        print(existingUser);
        if (existingUser.isNotEmpty) {
          // User already exists, redirect to login page
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Account already Exists'),
              content: const Text(
                'There\'s already a account associated with this Email, please login.!',
              ),
              actions: [
                TextButton(
                  child: const Text('Login Now'),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, LoginPage.routeName),
                ),
              ],
            ),
          );
          return; // Stop further execution
        }

        // Create user account with Firebase Authentication
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Store user data in Firestore
        await usersCollection.doc(userCredential.user!.uid).set({
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'phoneNumber': _phonenumberController.text,
          'age': _ageController.text,
          'role': 'user',
        });

        // Display success message or navigate to the next screen
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('User registered successfully!'),
            actions: [
              TextButton(
                child: const Text('Login now'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, LoginPage.routeName),
              ),
            ],
          ),
        );
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } catch (error) {
        // Display error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to register user: $error'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Theme.of(context).splashColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Additional email validation logic
                    final emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    // Additional age validation logic
                    final age = int.tryParse(value);
                    if (age == null || age < 18 || age > 100) {
                      return 'Please enter a valid age between 18 and 100';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _phonenumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    // Additional phone number validation logic
                    final phoneNumberRegex = RegExp(
                        r'^[0-9]{10}$'); // Validates a 10-digit phone number
                    if (!phoneNumberRegex.hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Additional password validation logic
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    }
                    if (!value.contains(RegExp(r'[a-z]'))) {
                      return 'Password must contain at least one lowercase letter';
                    }
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'Password must contain at least one digit';
                    }
                    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    }
                    // Add more password validation criteria as needed
                    return null;
                  },
                  maxLength: 16,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _reenterPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Re-enter password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    // Additional password validation logic
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  maxLength: 16,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
