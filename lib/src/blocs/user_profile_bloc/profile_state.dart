
import 'package:equatable/equatable.dart';
class ProfileState extends Equatable{
  final String? gender;
  final String? ageRange;
  final bool? notificationsEnabled;

  const ProfileState({
    this.gender,
    this.ageRange,
    this.notificationsEnabled,
  });

  ProfileState copyWith({
    String? gender,
    String? ageRange,
    bool? notificationsEnabled,
  }) {
    return ProfileState(
      gender: gender ?? this.gender,
      ageRange: ageRange ?? this.ageRange,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override

  List<Object?> get props => [gender, ageRange, notificationsEnabled];
}