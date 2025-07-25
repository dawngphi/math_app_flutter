import 'package:math_app/src/blocs/user_profile_bloc/profile_event.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/user_database.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<SelectGender>(selectGender);
    on<SelectAgeRange>(selectAge);
    on<ToggleNotification>(toggleNotification);
    on<UpdateLives>(onUpdateLives);
    on<LoadUserProfile>(loadUserProfile);
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
  Future<void> onUpdateLives(UpdateLives event, Emitter<ProfileState> emit) async {
    await UserDatabase.instance.updateLives(event.userId, event.lives);

    emit(state.copyWith(lives: event.lives));
  }
  void loadUserProfile(LoadUserProfile event, Emitter<ProfileState> emit) {
    emit(state.copyWith(
      id: event.user.id,
      gender: event.user.gender,
      ageRange: event.user.ageRange,
      notificationsEnabled: event.user.notificationsEnabled,
      lives: event.user.lives,
    ));
  }
}

