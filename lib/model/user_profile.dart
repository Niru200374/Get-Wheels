// lib/models/user_profile.dart
class UserProfile {
  final String name;
  final String email;
  final int treksCompleted;
  final int reviewsGiven;
  final int guidesContacted;

  UserProfile({
    required this.name,
    required this.email,
    required this.treksCompleted,
    required this.reviewsGiven,
    required this.guidesContacted,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'unknown@example.com',
      treksCompleted: json['treks_completed'] ?? 0,
      reviewsGiven: json['reviews_given'] ?? 0,
      guidesContacted: json['guides_contacted'] ?? 0,
    );
  }
}