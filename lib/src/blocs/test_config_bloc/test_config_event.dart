import 'package:equatable/equatable.dart';

abstract class TestConfigEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class UpdateOperation extends TestConfigEvent {
  final String operation;
  UpdateOperation(this.operation);
  @override
  List<Object?> get props => [operation];
}

class UpdateDifficulty extends TestConfigEvent {
  final int minNumber;
  final int maxNumber;

  UpdateDifficulty(this.minNumber, this.maxNumber);

  @override
  // TODO: implement props
  List<Object?> get props => [minNumber, maxNumber];
}

class UpdateTimePerQuestion extends TestConfigEvent {
  final int timePerQuestion;
  UpdateTimePerQuestion(this.timePerQuestion);

  @override
  // TODO: implement props
  List<Object?> get props => [timePerQuestion];

}

class ResetConfig extends TestConfigEvent {}



