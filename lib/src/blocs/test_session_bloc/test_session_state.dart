 import 'package:equatable/equatable.dart';

import '../../models/question_models/question_model.dart';
import '../../pages/test_pages/test_pages_3/review_answer_page.dart';

class TestSessionState extends Equatable{
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final int score;
  final int lives;
  final int timeLeft;
  final bool isActive;
  final String? resultMessage;
  final bool isCorrect;
  final List<AnswerReview> answerReviews;
  final int consecutiveCorrect;
  final int maxTimePerQuestion;

  const TestSessionState({
    this.questions = const [],
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.lives = 3,
    this.timeLeft = 0,
    this.isActive = false,
    this.resultMessage,
    this.isCorrect = false,
    this.answerReviews = const [],
    this.consecutiveCorrect = 0,
    this.maxTimePerQuestion = 10,
  });
  TestSessionState copyWith({
    List<QuestionModel>? questions,
    int? currentQuestionIndex,
    int? score,
    int? lives,
    int? timeLeft,
    bool? isActive,
    String? resultMessage,
    bool? isCorrect,
    List<AnswerReview>? answerReviews,
    int? consecutiveCorrect,
    int? maxTimePerQuestion,
  }) {
    return TestSessionState(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      score: score ?? this.score,
      lives: lives ?? this.lives,
      timeLeft: timeLeft ?? this.timeLeft,
      isActive: isActive ?? this.isActive,
      resultMessage: resultMessage,
      isCorrect: isCorrect ?? this.isCorrect,
      answerReviews: answerReviews ?? this.answerReviews,
      consecutiveCorrect: consecutiveCorrect ?? this.consecutiveCorrect,
      maxTimePerQuestion: maxTimePerQuestion ?? this.maxTimePerQuestion,
    );
  }
  QuestionModel? get currentQuestion =>
      questions.isNotEmpty && currentQuestionIndex < questions.length
          ? questions[currentQuestionIndex]
          : null;

  bool get isFinished => !isActive || lives <= 0 || currentQuestionIndex >= questions.length;

  @override
  List<Object?> get props => [
    questions, currentQuestionIndex, score, lives, timeLeft,
    isActive, resultMessage, isCorrect, answerReviews, consecutiveCorrect
  ];
}

 class AnswerReview {
   final String questionText;
   final int userAnswer;
   final int correctAnswer;
   final bool isCorrect;

   AnswerReview({
     required this.questionText,
     required this.userAnswer,
     required this.correctAnswer,
     required this.isCorrect,
   });
 }