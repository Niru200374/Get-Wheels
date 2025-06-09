// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/vehicle.dart';

class Booking {
  final int id;
  final int vehicleId;
  final String startDate;
  final String endDate;
  final String status;
  final String createdAt;

  Booking({
    required this.id,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      vehicleId: json['vehicle']['id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}

class ApiService {
  static const String baseUrl = 'http://localhost:8000'; // Replace with your IP if needed

  // Register a new user
  Future<Map<String, dynamic>> register(String username, String email, String password, String firstName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'first_name': firstName,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data; // Returns user data
    } else {
      throw Exception('Failed to register: ${response.statusCode} - ${response.body}');
    }
  }

  // Log in a user (optional, since we're not using authentication)
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Returns user data
    } else {
      throw Exception('Failed to login: ${response.statusCode} - ${response.body}');
    }
  }

  Future<List<Vehicle>> fetchVehicles(String vehicleType) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/vehicles/?vehicle_type=$vehicleType'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Vehicle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vehicles: ${response.statusCode}');
    }
  }

  Future<Booking> createBooking(int vehicleId, int userId, String startDate, String endDate) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/bookings/create/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'vehicle': vehicleId,
        'user_id': userId,
        'start_date': startDate,
        'end_date': endDate,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Booking.fromJson(data);
    } else {
      throw Exception('Failed to create booking: ${response.statusCode} - ${response.body}');
    }
  }

  Future<List<Booking>> fetchBookings() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/bookings/'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Booking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookings: ${response.statusCode}');
    }
  }
}