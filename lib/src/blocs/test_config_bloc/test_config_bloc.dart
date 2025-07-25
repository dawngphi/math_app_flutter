import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/test_config_bloc/test_config_event.dart';
import 'package:math_app/src/blocs/test_config_bloc/test_config_state.dart';

class TestConfigBloc extends Bloc<TestConfigEvent, TestConfigState> {
  TestConfigBloc() : super(const TestConfigState()) {
    on<UpdateOperation>(_onUpdateOperation);
    on<UpdateDifficulty>(_onUpdateDifficulty);
    on<UpdateTimePerQuestion>(_onUpdateTimePerQuestion);
    on<ResetConfig>(_onResetConfig);
  }


  void _onUpdateOperation(UpdateOperation event, Emitter<TestConfigState> emit) {
    emit(state.copyWith(selectedOperation: event.operation));
  }

  void _onUpdateDifficulty(UpdateDifficulty event, Emitter<TestConfigState> emit) {
    final isValid = event.minNumber <= event.maxNumber &&
        event.minNumber >= 1 &&
        event.maxNumber <= 1000;

    emit(state.copyWith(
      minNumber: event.minNumber,
      maxNumber: event.maxNumber,
      isValid: isValid,
    ));
  }

  void _onUpdateTimePerQuestion(UpdateTimePerQuestion event, Emitter<TestConfigState> emit) {
    final isValid = event.timePerQuestion >= 1 && event.timePerQuestion <= 60;
    emit(state.copyWith(
      timePerQuestion: event.timePerQuestion,
      isValid: isValid,
    ));
  }

  void _onResetConfig(ResetConfig event, Emitter<TestConfigState> emit) {
    emit(const TestConfigState());
  }
}