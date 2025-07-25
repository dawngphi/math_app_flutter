import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final int selectedIndex;
  const LanguageState({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];

}