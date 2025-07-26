import 'package:equatable/equatable.dart';

import '../../models/question_models/question_model.dart';

class DuelGameState extends Equatable{
  final List<QuestionModel> questions;
  final int currentIndex;
  final int player1Score;
  final int player2Score;
  final bool isGameOver;
  final int? winner;
  final String? message;
  final Map<int, int?> selectedAnswers;
  final Map<int, bool?> isCorrect;
  final int timeLeft;
  final bool isActive;
  final bool isPaused;
  final List<List<int>> answersList;
  final int maxTimePerQuestion;

  const DuelGameState({
    this.questions = const [],
    this.currentIndex = 0,
    this.player1Score = 0,
    this.player2Score = 0,
    this.isGameOver = false,
    this.winner,
    this.message,
    this.selectedAnswers = const {},
    this.isCorrect = const {},
    this.timeLeft = 0,
    this.isActive = false,
    this.isPaused = false,
    this.answersList = const [],
    this.maxTimePerQuestion = 10,
  });

  DuelGameState copyWith({
    List<QuestionModel>? questions,
    int? currentIndex,
    int? player1Score,
    int? player2Score,
    bool? isGameOver,
    int? winner,
    String? message,
    Map<int, int?>? selectedAnswers,
    Map<int, bool?>? isCorrect,
    int? timeLeft,
    bool? isActive,
    bool? isPaused,
    List<List<int>>? answersList,
    int? maxTimePerQuestion,
  }) {
    return DuelGameState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      player1Score: player1Score ?? this.player1Score,
      player2Score: player2Score ?? this.player2Score,
      isGameOver: isGameOver ?? this.isGameOver,
      winner: winner ?? this.winner,
      message: message ?? this.message,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isCorrect: isCorrect ?? this.isCorrect,
      timeLeft: timeLeft ?? this.timeLeft,
      isActive: isActive ?? this.isActive,
      isPaused: isPaused ?? this.isPaused,
      answersList: answersList ?? this.answersList,
      maxTimePerQuestion: maxTimePerQuestion ?? this.maxTimePerQuestion,
    );
  }

  QuestionModel? get currentQuestion =>
      questions.isNotEmpty && currentIndex < questions.length
          ? questions[currentIndex]
          : null;

  List<int> get currentAnswers =>
      answersList.isNotEmpty && currentIndex < answersList.length
          ? answersList[currentIndex]
          : [];

  bool get canAnswer => isActive && !isGameOver && !isPaused && winner == null;

  bool get isGameFinished => isGameOver || currentIndex >= questions.length;

  int get totalQuestions => questions.length;

  double get progress => questions.isEmpty ? 0.0 : currentIndex / questions.length;

  @override
  List<Object?> get props => [
    questions,
    currentIndex,
    player1Score,
    player2Score,
    isGameOver,
    winner,
    message,
    selectedAnswers,
    isCorrect,
    timeLeft,
    isActive,
    isPaused,
    answersList,
    maxTimePerQuestion,
  ];
}