
import 'package:equatable/equatable.dart';

import '../../models/user_profile_model.dart';
abstract class ProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SelectGender extends ProfileEvent {
  final String gender;
  SelectGender(this.gender);
}

class SelectAgeRange extends ProfileEvent {
  final String ageRange;
  SelectAgeRange(this.ageRange);
}

class ToggleNotification extends ProfileEvent {
  final bool enabled;
  ToggleNotification(this.enabled);
}
class UpdateLives extends ProfileEvent {
  final int userId;
  final int lives;
  UpdateLives(this.userId, this.lives);

  @override
  List<Object?> get props => [userId, lives];
}
class LoadUserProfile extends ProfileEvent {
  final UserProfileModel user;
  LoadUserProfile(this.user);

  @override
  List<Object?> get props => [user];
}