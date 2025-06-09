// lib/SplashScreen.dart
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4), // Total duration: 3s rotation + 1s slide
      vsync: this,
    );

    // Rotation animation: Rotate the logo for 3 seconds (3 full rotations)
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 3 * 2 * 3.14159, // 3 full rotations (3 * 2π radians)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.linear), // 0% to 75% of the timeline (3s)
      ),
    );

    // Slide animation: Move the logo to the right in the last 1 second
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // Center
      end: const Offset(1, 0), // Right
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut), // 75% to 100% of the timeline (1s)
      ),
    );

    // Navigate after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimationAndNavigate() {
    _controller.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Logo with Rotation and Slide
            SlideTransition(
              position: _slideAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.directions_car,
                      size: 150,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
            // "Let's Roll In" Button
            ElevatedButton(
              onPressed: _startAnimationAndNavigate,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Let's Roll In",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}