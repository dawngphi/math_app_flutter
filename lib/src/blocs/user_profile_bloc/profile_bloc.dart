import 'package:math_app/src/blocs/user_profile_bloc/profile_event.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<SelectGender>(selectGender);
    on<SelectAgeRange>(selectAge);
    on<ToggleNotification>(toggleNotification);
  }

  void selectGender(SelectGender event, Emitter<ProfileState> emitted) {
    emitted(state.copyWith(gender: event.gender));
  }
  void selectAge(SelectAgeRange event, Emitter<ProfileState> emitted){
    emitted(state.copyWith(ageRange: event.ageRange));
  }
  void toggleNotification(ToggleNotification event, Emitter<ProfileState> emitted) {
    emitted(state.copyWith(notificationsEnabled: event.enabled));
  }
}

