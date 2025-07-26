import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/duel_game_bloc/duel_game_event.dart';
import 'package:math_app/src/blocs/duel_game_bloc/duel_game_state.dart';

class DuelGameBloc extends Bloc<DuelGameEvent, DuelGameState> {
  Timer? _timer;
  static const int winScore = 10;
  DuelGameBloc() : super(const DuelGameState()) {
    on<StartDuelGame>(_onStartDuelGame);
    on<SubmitAnswer>(_onSubmitAnswer);
    on<TimeoutQuestion>(_onTimeoutQuestion);
    on<NextQuestion>(_onNextQuestion);
    on<ResetGame>(_onResetGame);
    on<PauseGame>(_onPauseGame);
    on<ResumeGame>(_onResumeGame);
  }
  void _onStartDuelGame(StartDuelGame event, Emitter<DuelGameState> emit) {
    final answersList = event.questions
        .map((q) => q.getShuffledAnswers())
        .toList();

    emit(
      state.copyWith(
        questions: event.questions,
        answersList: answersList,
        isActive: true,
        timeLeft: event.timePerQuestion,
        maxTimePerQuestion: event.timePerQuestion,
        isPaused: false,
      ),
    );

    _startTimer(event.timePerQuestion, emit);
  }

  void _onSubmitAnswer(SubmitAnswer event, Emitter<DuelGameState> emit) {
    if (!state.canAnswer || state.currentQuestion == null) return;

    if (state.selectedAnswers[event.player] != null) return;

    final question = state.currentQuestion!;
    final isCorrect = event.answer == question.answer;

    final newSelectedAnswers = Map<int, int?>.from(state.selectedAnswers);
    final newIsCorrect = Map<int, bool?>.from(state.isCorrect);

    newSelectedAnswers[event.player] = event.answer;
    newIsCorrect[event.player] = isCorrect;

    emit(
      state.copyWith(
        selectedAnswers: newSelectedAnswers,
        isCorrect: newIsCorrect,
      ),
    );

    if (isCorrect) {
      _handleCorrectAnswer(event.player, emit);
    } else {
      _handleWrongAnswer(event.player, emit);
    }
  }

  void _handleCorrectAnswer(int player, Emitter<DuelGameState> emit) {
    final newPlayer1Score = player == 1
        ? state.player1Score + 1
        : state.player1Score;
    final newPlayer2Score = player == 2
        ? state.player2Score + 1
        : state.player2Score;

    emit(
      state.copyWith(
        player1Score: newPlayer1Score,
        player2Score: newPlayer2Score,
        winner: player,
        message: "Người chơi $player trả lời đúng!",
      ),
    );

    _timer?.cancel();

    if (newPlayer1Score >= winScore || newPlayer2Score >= winScore) {
      _endGame(newPlayer1Score >= winScore ? 1 : 2, emit);
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        if (!isClosed) add(NextQuestion());
      });
    }
  }

  void _handleWrongAnswer(int player, Emitter<DuelGameState> emit) {
    emit(state.copyWith(message: "Sai rồi!"));

    Future.delayed(const Duration(seconds: 1), () {
      if (!isClosed) {
        final newSelectedAnswers = Map<int, int?>.from(state.selectedAnswers);
        final newIsCorrect = Map<int, bool?>.from(state.isCorrect);
        newSelectedAnswers[player] = null;
        newIsCorrect[player] = null;

        emit(
          state.copyWith(
            selectedAnswers: newSelectedAnswers,
            isCorrect: newIsCorrect,
            message: null,
          ),
        );
      }
    });
  }

  void _onTimeoutQuestion(TimeoutQuestion event, Emitter<DuelGameState> emit) {
    if (!state.isActive || state.currentQuestion == null) return;

    emit(state.copyWith(message: "Hết thời gian!"));

    Future.delayed(const Duration(seconds: 1), () {
      if (!isClosed) add(NextQuestion());
    });
  }

  void _onNextQuestion(NextQuestion event, Emitter<DuelGameState> emit) {
    final nextIndex = state.currentIndex + 1;

    if (nextIndex >= state.questions.length) {
      _endGame(null, emit);
      return;
    }

    emit(
      state.copyWith(
        currentIndex: nextIndex,
        winner: null,
        message: null,
        selectedAnswers: {},
        isCorrect: {},
        timeLeft: state.maxTimePerQuestion,
      ),
    );

    _startTimer(state.maxTimePerQuestion, emit);
  }

  void _endGame(int? winner, Emitter<DuelGameState> emit) {
    final message = winner != null
        ? "Người chơi $winner thắng chung cuộc!"
        : "Hết câu hỏi!";

    emit(
      state.copyWith(
        isGameOver: true,
        winner: winner,
        message: message,
        isActive: false,
      ),
    );

    _timer?.cancel();
  }

  void _onResetGame(ResetGame event, Emitter<DuelGameState> emit) {
    _timer?.cancel();
    emit(const DuelGameState());
  }

  void _onPauseGame(PauseGame event, Emitter<DuelGameState> emit) {
    if (state.isActive && !state.isGameOver) {
      _timer?.cancel();
      emit(state.copyWith(isPaused: true));
    }
  }

  void _onResumeGame(ResumeGame event, Emitter<DuelGameState> emit) {
    if (state.isPaused && !state.isGameOver) {
      emit(state.copyWith(isPaused: false));
      _startTimer(state.timeLeft, emit);
    }
  }

  void _startTimer(int duration, Emitter<DuelGameState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0 && !state.isPaused) {
        emit(state.copyWith(timeLeft: state.timeLeft - 1));
      } else if (state.timeLeft <= 0) {
        timer.cancel();
        if (!isClosed) add(TimeoutQuestion());
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
