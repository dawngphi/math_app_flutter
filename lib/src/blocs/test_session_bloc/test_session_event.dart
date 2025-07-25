import 'package:equatable/equatable.dart';

import '../../models/question_models/question_model.dart';

abstract class TestSessionEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class StartTestSession extends TestSessionEvent {
  final List<QuestionModel> questions;
  final int timePerQuestion;
  final int initialLives;

  StartTestSession(this.questions, this.timePerQuestion, this.initialLives);

  @override
  List<Object?> get props => [questions, timePerQuestion, initialLives];
}

class SubmitAnswer extends TestSessionEvent {
  final int answer;
  SubmitAnswer(this.answer);

  @override
  List<Object?> get props => [answer];
}

class TimeoutQuestion extends TestSessionEvent {}

class NextQuestion extends TestSessionEvent {}

class EndTestSession extends TestSessionEvent {}
class Tick extends TestSessionEvent {}