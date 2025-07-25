class UserProfileModel {
  final int? id;
  final String gender;
  final String ageRange;
  final bool notificationsEnabled;
  final int lives;

  UserProfileModel({
    this.id,
    required this.gender,
    required this.ageRange,
    required this.notificationsEnabled,
    this.lives = 3,
  });
  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'],
      gender: map['gender'],
      ageRange: map['age_range'],
      notificationsEnabled: map['notifications_enabled'] == 1,
      lives: map['lives'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gender': gender,
      'age_range': ageRange,
      'notifications_enabled': notificationsEnabled ? 1 : 0,
      'lives': lives,
    };
  }
}