import 'package:equatable/equatable.dart';

class TestConfigState extends Equatable {
  final String selectedOperation;
  final int minNumber;
  final int maxNumber;
  final int timePerQuestion;
  final bool isValid;

  const TestConfigState({
    this.selectedOperation = '+',
    this.minNumber = 1,
    this.maxNumber = 10,
    this.timePerQuestion = 10,
    this.isValid = true,
  });

  TestConfigState copyWith({
    String? selectedOperation,
    int? minNumber,
    int? maxNumber,
    int? timePerQuestion,
    bool? isValid,
  }) {
    return TestConfigState(
      selectedOperation: selectedOperation ?? this.selectedOperation,
      minNumber: minNumber ?? this.minNumber,
      maxNumber: maxNumber ?? this.maxNumber,
      timePerQuestion: timePerQuestion ?? this.timePerQuestion,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedOperation, minNumber, maxNumber, timePerQuestion, isValid];
}