import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/test_session_bloc/test_session_bloc.dart';
import 'package:math_app/src/blocs/test_session_bloc/test_session_event.dart';
import 'package:math_app/src/pages/test_pages/test_pages_3/test_page_3.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/answer_box_item.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/question_area_item.dart';
import '../../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../../blocs/user_profile_bloc/profile_event.dart';
import '../../create_profile_pages/button_next.dart';

class TestPage2 extends StatefulWidget {
  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  final answerController = TextEditingController();
  final answerBoxKey = GlobalKey<AnswerBoxItemState>();
  String answer = "";
  int? lastQuestionIndex;
  int? lastLives;

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final testState = context.watch<TestSessionBloc>().state;
    final profileState = context.watch<ProfileBloc>().state;


    // Khi sang câu mới, clear input
    if (lastQuestionIndex != testState.currentQuestionIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        answerBoxKey.currentState?.clear();
      });
      lastQuestionIndex = testState.currentQuestionIndex;
    }
    // Khi lives tăng, cập nhật vào ProfileBloc
    if (lastLives != null && testState.lives > lastLives!) {
      final userId = profileState.id;
      if (userId != null) {
        context.read<ProfileBloc>().add(UpdateLives(userId, testState.lives));
      }
    }
    lastLives = testState.lives;

    if (!testState.isActive) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (testState.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => TestPage3(
              correct: testState.score,
              wrong: testState.questions.length - testState.score,
              reward: testState.score ~/ 2,
              answerReviews: testState.answerReviews,
            ),
          ),
        );
      });
      return SizedBox.shrink();
    }
    final q = testState.currentQuestion;
    if (q == null) return Center(child: Text("No question"));


    return Scaffold(
      appBar: _buildAppBar(
        testState.lives,
        testState.timeLeft,
        testState.maxTimePerQuestion,
        testState.questions.length,
        testState.currentQuestionIndex,),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              QuestionAreaItem(
                number1: q.number1,
                number2: q.number2,
                operation: q.operation,
              ),
              AnswerBoxItem(
                key: answerBoxKey,
                onChanged: (val) {
                  answer = val;
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
          if (testState.resultMessage != null)
            Positioned(
              top: 250,
              child: Text(
                testState.resultMessage!,
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: testState.isCorrect ? Colors.green : Colors.red,
                  shadows: const [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(
        title: "Check",
        onPressed: testState.resultMessage == null && testState.timeLeft > 0
            ? () {
          final ans = int.tryParse(answer) ?? -99999;
          context.read<TestSessionBloc>().add(SubmitAnswer(ans));
        }
            : null,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(int lives, int timeLeft,int maxTimePerQuestion, int total, int current) {
    final progress = (timeLeft.toDouble() / maxTimePerQuestion).clamp(0.0, 1.0);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF3AAFFF),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/images/tim_icon.png", width: 30),
            ),
            Text(
              "x$lives",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Fredoka',
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Container(
          width: 230.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: const Color(0xFF4FC3F7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF424242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/pause_icon.png", width: 30),
        ),
      ],
    );
  }
}