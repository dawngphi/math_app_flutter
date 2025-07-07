
import 'package:equatable/equatable.dart';
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