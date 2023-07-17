import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './pages/people.dart';
import './pages/menu.dart';
import './pages/me.dart';
import './pages/calculator_page.dart';
import './pages/about.dart';
import './pages/map.dart';
import './pages/user_profile.dart';
import './pages/order_page.dart';
import './pages/admin_home_page.dart';
import './pages/user_home_page.dart';

import './pages/login_page.dart';
import './pages/signup_page.dart';
import './pages/logout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? role;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final uid = user.uid;
      final userRole = await getUserRole(uid);
      setState(() {
        role = userRole;
      });
    } else {}
  }

  Future<String?> getUserRole(String uid) async {
    try {
      var data;
      var snapshot = await firestore.collection('userDetails').doc(uid).get();
      if (snapshot.exists) {
        data = snapshot.data();
        if (data != null && data.containsKey('role')) {
          return data['role'] as String?;
        }
      }
      return null; // User document doesn't exist or role is not available
    } catch (e) {
      print('Error fetching user role: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Oops!'),
            content: Text('$e'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (role != "") {
      return MaterialApp(
        title: 'Hotel Sri Sai Krishna',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
              weight: 3,
            ),
          ),
          fontFamily: 'Macondo',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) =>
              role == 'admin' ? AdminHomePage() : UserHomePage(),
          '/calculator': (context) => CalculatorPage(),
          '/me': (context) => Me(),
          '/about': (context) => About(),
          '/menu': (context) => Menu(),
          '/people': (context) => People(),
          '/map': (context) => Map(),
          '/profile': (context) => UserProfilePage(),
          '/order': (context) => OrderPage(),
          '/logout': (context) => Logout(),
          '/loginpage': (context) => LoginPage(),
          '/signUp': (context) => SignupPage(),
        },
        debugShowCheckedModeBanner: false,
      );
    } else {
      // Show loading or splash screen
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF003628),
        title: const Center(
          child: Text(
            "Hotel Sri Sai Krishna",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(),
    );
  }
}
