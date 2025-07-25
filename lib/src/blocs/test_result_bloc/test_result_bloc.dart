import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/test_result_bloc/test_result_event.dart';
import 'package:math_app/src/blocs/test_result_bloc/test_result_state.dart';

class TestResultBloc extends Bloc<TestResultEvent, TestResultState>{
  TestResultBloc() : super(const TestResultState()) {
    on<SaveTestResult>(_onSaveTestResult);
    on<LoadTestHistory>(_onLoadTestHistory);
    on<ClearTestHistory>(_onClearTestHistory);
  }


  void _onSaveTestResult(SaveTestResult event, Emitter<TestResultState> emit) {
    // TODO: Implement database save
    // For now, just add to local state
    final newResult = TestResult(
      id: DateTime.now().millisecondsSinceEpoch,
      dateTime: DateTime.now(),
      correctAnswers: event.correctAnswers,
      totalQuestions: event.totalQuestions,
      reward: event.reward,
      operation: event.operation,
      difficulty: event.difficulty,
    );

    final updatedHistory = List<TestResult>.from(state.testHistory)..add(newResult);
    emit(state.copyWith(testHistory: updatedHistory));
  }

  void _onLoadTestHistory(LoadTestHistory event, Emitter<TestResultState> emit) {
    emit(state.copyWith(isLoading: true));
    // TODO: Implement database load
    emit(state.copyWith(isLoading: false));
  }

  void _onClearTestHistory(ClearTestHistory event, Emitter<TestResultState> emit) {
    emit(state.copyWith(testHistory: []));
  }
}