// lib/model/vehicle.dart
class Vehicle {
  final int id;
  final String name;
  final String vehicleType;
  final String description;
  final int capacity;
  final bool isAvailable;
  final String image;

  Vehicle({
    required this.id,
    required this.name,
    required this.vehicleType,
    required this.description,
    required this.capacity,
    required this.isAvailable,
    required this.image,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      vehicleType: json['vehicle_type'] ?? '',
      description: json['description'] ?? '',
      capacity: json['capacity'] ?? 0,
      isAvailable: json['is_available'] ?? false,
      image: json['image'] ?? '',
    );
  }
}