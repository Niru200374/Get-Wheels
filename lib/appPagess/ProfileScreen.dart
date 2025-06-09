// lib/ProfileScreen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home'); // Redirect to HomeScreen
          },
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20), // Reduced space since AppBar is added
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Neeruu Silwal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 16, 15, 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Niru.silwal@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(179, 67, 67, 67),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            // My Activity Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My activity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActivityCard('Booking Completed', '5'),
                      _buildActivityCard('Review Given', '15'),
                      _buildActivityCard('Vehicles Reserved', '55'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Quick Actions Section
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildQuickActionTile(
                    context,
                    icon: Icons.bookmark_border,
                    title: 'My bookings',
                    onTap: () {
                      Navigator.pushNamed(context, '/bookings');
                    },
                  ),
                  _buildQuickActionTile(
                    context,
                    icon: Icons.star_border,
                    title: 'My Reviews',
                    onTap: () {
                      // Navigate to Reviews screen
                    },
                  ),
                  _buildQuickActionTile(
                    context,
                    icon: Icons.settings,
                    title: 'Setting',
                    onTap: () {
                      // Navigate to Settings screen
                    },
                  ),
                  _buildQuickActionTile(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    textColor: Colors.red,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build activity cards
  Widget _buildActivityCard(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper method to build quick action tiles
  Widget _buildQuickActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}