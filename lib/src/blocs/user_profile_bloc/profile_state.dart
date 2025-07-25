
import 'package:equatable/equatable.dart';
class ProfileState extends Equatable{
  final int? id;
  final String? gender;
  final String? ageRange;
  final bool? notificationsEnabled;
  final int lives;

  const ProfileState({
    this.id,
    this.gender,
    this.ageRange,
    this.notificationsEnabled,
    this.lives = 3,
  });

  ProfileState copyWith({
    int? id,
    String? gender,
    String? ageRange,
    bool? notificationsEnabled,
    int? lives,
  }) {
    return ProfileState(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      ageRange: ageRange ?? this.ageRange,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      lives: lives ?? this.lives,
    );
  }

  @override

  List<Object?> get props => [gender, ageRange, notificationsEnabled, lives];
}