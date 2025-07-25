import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/language_bloc/language_event.dart';
import 'package:math_app/src/blocs/language_bloc/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(selectedIndex: 0)) {
    on<LoadLanguageEvent>(_onLoadLanguage);
    on<SelectLanguageEvent>(_onSelectLanguage);
  }

  Future<void> _onLoadLanguage(
      LoadLanguageEvent event, Emitter<LanguageState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt('selected_language_index') ?? 0;
    emit(LanguageState(selectedIndex: index));
  }
  Future<void> _onSelectLanguage(
      SelectLanguageEvent event, Emitter<LanguageState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_language_index', event.selectedIndex);
    emit(LanguageState(selectedIndex: event.selectedIndex));
  }
}

