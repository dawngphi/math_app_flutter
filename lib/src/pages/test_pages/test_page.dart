import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/test_config_bloc/test_config_bloc.dart';
import 'package:math_app/src/blocs/test_config_bloc/test_config_event.dart';
import 'package:math_app/src/blocs/test_config_bloc/test_config_state.dart';
import 'package:math_app/src/pages/test_pages/difficulty_item.dart';
import 'package:math_app/src/pages/test_pages/select_challenge_item.dart';
import 'package:math_app/src/pages/test_pages/time_test_item.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/test_page_2.dart';
import '../../blocs/test_session_bloc/test_session_bloc.dart';
import '../../blocs/test_session_bloc/test_session_event.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../models/question_models/question_model.dart';
import '../create_profile_pages/button_next.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final configState = context.watch<TestConfigBloc>().state;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(
        title: "Start",
        onPressed: () {
          final questions = generateQuestions(
            operation: configState.selectedOperation,
            min: configState.minNumber,
            max: configState.maxNumber,
            count: 20,
          );
          final profileState = context.read<ProfileBloc>().state;
          final initialLives = profileState.lives;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                final bloc = TestSessionBloc();
                bloc.add(StartTestSession(questions, configState.timePerQuestion, initialLives));
                return BlocProvider.value(
                  value: bloc,
                  child: TestPage2(),
                );
              },
            ),
          );
        },
      ),
      appBar: _buildAppbar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // UI giữ nguyên, chỉ thay đổi callback
                SelectChallengeItem(
                  selectedOperation: configState.selectedOperation,
                  onChanged: (op) {
                    context.read<TestConfigBloc>().add(UpdateOperation(op));
                  },
                ),
                SizedBox(height: 20.h),
                DifficultyItem(
                  title: "Difficulty (Max number=1000)",
                  minValue: configState.minNumber,
                  maxValue: configState.maxNumber,
                  onMinChanged: (v) => context.read<TestConfigBloc>().add(UpdateDifficulty(v, configState.maxNumber)),
                  onMaxChanged: (v) => context.read<TestConfigBloc>().add(UpdateDifficulty(configState.minNumber, v)),
                ),
                SizedBox(height: 20.h),
                TimeTestItem(
                  title: "Time (maximum time=60s)",
                  time: configState.timePerQuestion,
                  onTimeChanged: (v) => context.read<TestConfigBloc>().add(UpdateTimePerQuestion(v)),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset("assets/images/back_icon2.png"),
      ),
      title: Text(
        "Test",
        style: TextStyle(fontSize: 24, fontFamily: 'Fredoka'),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/question_icon.png"),
        ),
      ],
    );
  }
}