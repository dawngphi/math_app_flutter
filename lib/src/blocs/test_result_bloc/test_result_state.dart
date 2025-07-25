import 'package:equatable/equatable.dart';

class TestResultState extends Equatable{
  final List<TestResult> testHistory;
  final bool isLoading;
  final String? error;

  const TestResultState({
    this.testHistory = const [],
    this.isLoading = false,
    this.error,
  });

  TestResultState copyWith({
    List<TestResult>? testHistory,
    bool? isLoading,
    String? error,
  }) {
    return TestResultState(
      testHistory: testHistory ?? this.testHistory,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [testHistory, isLoading, error];
}

class TestResult {
  final int id;
  final DateTime dateTime;
  final int correctAnswers;
  final int totalQuestions;
  final int reward;
  final String operation;
  final int difficulty;
  final double accuracy;

  TestResult({
    required this.id,
    required this.dateTime,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.reward,
    required this.operation,
    required this.difficulty,
  }) : accuracy = totalQuestions > 0 ? (correctAnswers / totalQuestions) * 100 : 0;
}