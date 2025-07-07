class UserProfileModel {
  final String gender;
  final String ageRange;
  final bool notificationsEnabled;

  UserProfileModel({
    required this.gender,
    required this.ageRange,
    required this.notificationsEnabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'age_range': ageRange,
      'notifications_enabled': notificationsEnabled ? 1 : 0,
    };
  }
}