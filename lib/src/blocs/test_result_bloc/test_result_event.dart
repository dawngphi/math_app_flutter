import 'package:equatable/equatable.dart';

import '../test_session_bloc/test_session_state.dart';

abstract class TestResultEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SaveTestResult extends TestResultEvent {
  final int correctAnswers;
  final int totalQuestions;
  final int reward;
  final String operation;
  final int difficulty;
  final List<AnswerReview> answerReviews;

  SaveTestResult({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.reward,
    required this.operation,
    required this.difficulty,
    required this.answerReviews,
  });

  @override
  List<Object?> get props => [correctAnswers, totalQuestions, reward, operation, difficulty, answerReviews];
}

class LoadTestHistory extends TestResultEvent {}

class ClearTestHistory extends TestResultEvent {}