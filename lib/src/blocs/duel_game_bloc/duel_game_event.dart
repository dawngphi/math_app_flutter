import 'package:equatable/equatable.dart';
import 'package:math_app/src/models/question_models/question_model.dart';

abstract class DuelGameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartDuelGame extends DuelGameEvent {
  final List<QuestionModel> questions;
  final int timePerQuestion;

  StartDuelGame(this.questions, this.timePerQuestion);

  @override
  List<Object?> get props => [questions, timePerQuestion];
}

class SubmitAnswer extends DuelGameEvent {
  final int player;
  final int answer;

  SubmitAnswer(this.player, this.answer);

  @override
  List<Object?> get props => [player, answer];
}

class TimeoutQuestion extends DuelGameEvent {}

class NextQuestion extends DuelGameEvent {}

class ResetGame extends DuelGameEvent {}

class PauseGame extends DuelGameEvent {}

class ResumeGame extends DuelGameEvent {}