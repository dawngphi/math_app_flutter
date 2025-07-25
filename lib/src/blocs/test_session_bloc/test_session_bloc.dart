import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/test_session_bloc/test_session_event.dart';
import 'package:math_app/src/blocs/test_session_bloc/test_session_state.dart';

class TestSessionBloc extends Bloc<TestSessionEvent, TestSessionState>{
  Timer? _timer;

  TestSessionBloc() : super(const TestSessionState()) {
    on<StartTestSession>(_onStartTestSession);
    on<SubmitAnswer>(_onSubmitAnswer);
    on<TimeoutQuestion>(_onTimeoutQuestion);
    on<NextQuestion>(_onNextQuestion);
    on<EndTestSession>(_onEndTestSession);
    on<Tick>((event, emit) {
      emit(state.copyWith(timeLeft: state.timeLeft - 1));
    });
  }
  void _onStartTestSession(StartTestSession event, Emitter<TestSessionState> emit) {
    emit(TestSessionState(
      questions: event.questions,
      timeLeft: event.timePerQuestion,
      lives: event.initialLives,
      isActive: true,
      maxTimePerQuestion: event.timePerQuestion,
    ));
    _startTimer(event.timePerQuestion, emit);
  }

  void _onSubmitAnswer(SubmitAnswer event, Emitter<TestSessionState> emit) async {
    if (!state.isActive || state.currentQuestion == null) return;

    _timer?.cancel();

    final question = state.currentQuestion!;
    final isCorrect = event.answer == question.answer;
    final questionText = "${question.number1}${question.operation}${question.number2}";

    final newAnswerReviews = List<AnswerReview>.from(state.answerReviews)
      ..add(AnswerReview(
        questionText: questionText,
        userAnswer: event.answer,
        correctAnswer: question.answer,
        isCorrect: isCorrect,
      ));

    int newScore = state.score;
    int newLives = state.lives;
    int newConsecutiveCorrect = state.consecutiveCorrect;
    String resultMessage = '';
    bool isCorrectResult = false;

    if (isCorrect) {
      newScore++;
      newConsecutiveCorrect++;
      resultMessage = "Correct!";
      isCorrectResult = true;

      if (newConsecutiveCorrect == 2) {
        newLives++;
        newConsecutiveCorrect = 0;
      }
    } else {
      newLives--;
      newConsecutiveCorrect = 0;
      resultMessage = "Incorrect!";
    }

    emit(state.copyWith(
      score: newScore,
      lives: newLives,
      consecutiveCorrect: newConsecutiveCorrect,
      resultMessage: resultMessage,
      isCorrect: isCorrectResult,
      answerReviews: newAnswerReviews,
    ));

    // Đảm bảo await và kiểm tra emit.isDone
    await Future.delayed(const Duration(seconds: 1));
    if (!emit.isDone) add(NextQuestion());
  }

  void _onTimeoutQuestion(TimeoutQuestion event, Emitter<TestSessionState> emit) async {
    if (!state.isActive || state.currentQuestion == null) return;

    final question = state.currentQuestion!;
    final questionText = "${question.number1}${question.operation}${question.number2}";

    final newAnswerReviews = List<AnswerReview>.from(state.answerReviews)
      ..add(AnswerReview(
        questionText: questionText,
        userAnswer: -1, // Timeout
        correctAnswer: question.answer,
        isCorrect: false,
      ));

    emit(state.copyWith(
      lives: state.lives - 1,
      consecutiveCorrect: 0,
      resultMessage: "Time's up!",
      isCorrect: false,
      answerReviews: newAnswerReviews,
    ));

    await Future.delayed(const Duration(seconds: 1));
    if (!emit.isDone) add(NextQuestion());
  }

  void _onNextQuestion(NextQuestion event, Emitter<TestSessionState> emit) {
    if (state.isFinished) {
      add(EndTestSession());
      return;
    }

    final nextIndex = state.currentQuestionIndex + 1;
    emit(state.copyWith(
      currentQuestionIndex: nextIndex,
      timeLeft: state.questions.isNotEmpty ? 10 : 0, // Reset time
      resultMessage: null,
    ));

    if (state.questions.isNotEmpty) {
      _startTimer(state.questions.isNotEmpty ? 10 : 0, emit);
    }
  }

  void _onEndTestSession(EndTestSession event, Emitter<TestSessionState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isActive: false));
  }

  void _startTimer(int duration, Emitter<TestSessionState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 1) {
        timer.cancel();
        add(TimeoutQuestion());
      } else {
        // add một event mới, ví dụ Tick
        add(Tick());
      }
    });
  }


  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

}