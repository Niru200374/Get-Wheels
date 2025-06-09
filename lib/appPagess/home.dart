import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:ui/appPagess/ProfileScreen.dart';
class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, this.username = "User"});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // For bottom navigation

  // Pages for bottom navigation
  final List<Widget> _pages = [
    HomeContent(username: "User"), // Pass username directly
     ProfileScreen(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Wheels'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: _pages[_currentIndex], // Switch between Home and Profile
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Home content (separate widget for clarity)
class HomeContent extends StatelessWidget {
  final String username;

  const HomeContent({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Header
            Text(
              'Welcome, $username!',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Book Your Ride for Any Adventure',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Carousel Slider
          carousel_slider.CarouselSlider(
  options: carousel_slider.CarouselOptions(
    height: 200.0,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 16 / 9,
    autoPlayInterval: const Duration(seconds: 3),
  ),
  items: [
    'assets/C1.png',
    'assets/C2.png',
    'assets/C3.png',
    'assets/C4.png',
    'assets/C5.png',
  ].map((imagePath) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }).toList(),
),
            const SizedBox(height: 20),

            // Quick Action Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bookings', arguments: username);
              },
              child: const Text('Book a Vehicle'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/bookings');
                    },
                    child: const Text('View Bookings'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: const Text('Profile'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Featured Vehicles
            const Text(
              'Top Picks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildVehicleCard('SUV', 'assets/SUV.jpeg'),
                  _buildVehicleCard('Bolero', 'Bolero.jpeg'),
                  _buildVehicleCard('Bike', 'Beneli.jpeg'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Vehicle Cutout Images with Pop-up Animation
            const Text(
              'Choose Your Vehicle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                VehicleIcon(
                  name: 'Bus',
                  imagePath: 'assets/sajha bus.jpeg',
                  onTap: () => _navigateToBooking(context, 'Bus'),
                ),
                VehicleIcon(
                  name: 'Car',
                  imagePath: 'assets/Car.jpeg',
                  onTap: () => _navigateToBooking(context, 'Car'),
                ),
                VehicleIcon(
                  name: 'magic',
                  imagePath: 'assets/magic.jpeg',
                  onTap: () => _navigateToBooking(context, 'Magic'),
                ),
                VehicleIcon(
                  name: 'Mountaineer Bike',
                  imagePath: 'assets/Mountaineer bike.jpeg',
                  onTap: () => _navigateToBooking(context, 'Mountaineer Bike'),
                ),
                VehicleIcon(
                  name: 'Dump Truck',
                  imagePath: 'assets/Dump truck.jpeg',
                  onTap: () => _navigateToBooking(context, 'Truck'),
                ),
                VehicleIcon(
                  name: 'Van',
                  imagePath: 'assets/pick up van.jpeg',
                  onTap: () => _navigateToBooking(context, 'Van'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleCard(String name, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_car, size: 60),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _navigateToBooking(BuildContext context, String vehicleType) {
    Navigator.pushNamed(context, '/book', arguments: vehicleType);
  }
}

// Vehicle Icon with Pop-up Animation
class VehicleIcon extends StatefulWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  const VehicleIcon({super.key, required this.name, required this.imagePath, required this.onTap});

  @override
  _VehicleIconState createState() => _VehicleIconState();
}

class _VehicleIconState extends State<VehicleIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
          widget.onTap();
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.directions_car, size: 80),
                ),
                const SizedBox(height: 5),
                Text(widget.name, style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Profile Screen
