import 'package:flutter/material.dart';
import 'package:ui/SplashScreen.dart';
import 'login.dart'; // Your LoginScreen
import 'package:ui/appPagess/home.dart'; // Your HomeScreen
import 'appPagess/ProfileScreen.dart' as profile; // Your ProfileScreen
import 'signup.dart'; // Your SignupScreen
import 'BookingScreen.dart'; // Your BookingScreen


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Wheels',
      initialRoute: '/welcome', 
      routes: {
        '/welcome': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(username: "Neeruu Silwal"),
        '/profile': (context) =>  profile.ProfileScreen(),
        '/signup': (context) => const SignupScreen(),
        // Placeholder routes for HomeScreen navigation
        '/bookings': (context) => const BookingScreen(),
      },
    );
  }
}