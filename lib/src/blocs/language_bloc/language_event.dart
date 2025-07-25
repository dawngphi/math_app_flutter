import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLanguageEvent extends LanguageEvent {

}

class SelectLanguageEvent extends LanguageEvent {
  late final int selectedIndex;

  SelectLanguageEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}