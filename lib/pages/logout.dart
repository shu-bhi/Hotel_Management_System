import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_sri_sai_krishna/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatelessWidget {
  // Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Logout'),
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _signOut(context);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }

  // Implement sign out functionality
  void _signOut(BuildContext context) async {
    try {
      // Clear the timestamps
      await _clearTimestamps();

      // Sign out the user
      await _auth.signOut();

      // Redirect the user to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Handle sign out errors
      // Display an error message or perform any desired action
      print('Sign out failed. Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout Failed'),
            content: const Text('An error occurred while logging out.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Clear the timestamps
  Future<void> _clearTimestamps() async {
    const String timestampKey = 'last_login_timestamp';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(timestampKey);
  }
}
