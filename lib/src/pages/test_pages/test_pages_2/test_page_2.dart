import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/answer_box_item.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/question_area_item.dart';

import '../../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../../blocs/user_profile_bloc/profile_event.dart';
import '../../../models/question_models/question_model.dart';
import '../../create_profile_pages/button_next.dart';
import '../test_pages_3/test_page_3.dart';
import '../test_pages_3/review_answer_page.dart';

class TestPage2 extends StatefulWidget {
  final List<QuestionModel> questions;
  final int timePerQuestion;
  const TestPage2({required this.questions, required this.timePerQuestion, Key? key}) : super(key: key);

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  final answerBoxKey = GlobalKey<AnswerBoxItemState>();
  int current = 0;
  int score = 0;
  late int lives;
  late int timeLeft;
  Timer? timer;
  String answer = "";
  String? resultText;
  Color? resultColor;
  int consecutiveCorrect = 0;
  List<AnswerReview> answerReviews = [];

  @override
  void initState() {
    super.initState();
    lives = context.read<ProfileBloc>().state.lives;
    _resetTimer();
  }

  void _resetTimer() {
    timer?.cancel();
    timeLeft = widget.timePerQuestion;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        timeLeft--;
        if (timeLeft <= 0) {
          timer?.cancel();
          _handleTimeout();
        }
      });
    });
  }

  void _handleTimeout() {
    setState(() {
      lives--;
      consecutiveCorrect = 0;
      resultText = "Time's up!";
      resultColor = Colors.red;
    });
    _nextAfterDelay();
  }

  void checkAnswer() {
    if (timeLeft <= 0) return;
    timer?.cancel();
    final userAns = int.tryParse(answer) ?? -99999;
    final correctAns = widget.questions[current].answer;
    final questionText = "${widget.questions[current].number1}${widget.questions[current].operation}${widget.questions[current].number2}";
    // Lưu lại đáp án
    answerReviews.add(AnswerReview(
      questionText: questionText,
      userAnswer: userAns,
      correctAnswer: correctAns,
    ));
    final correct = widget.questions[current].answer == userAns;
    final userId = context.read<ProfileBloc>().state.id;

    setState(() {
      if (correct) {
        score++;
        consecutiveCorrect++;
        resultText = "Correct!";
        resultColor = Colors.green;
        if (consecutiveCorrect == 2) {
          lives++;
          consecutiveCorrect = 0;
          if (userId != null) {
            context.read<ProfileBloc>().add(UpdateLives(userId, lives));
          }
        }
      } else {
        lives--;
        consecutiveCorrect = 0;
        resultText = "Incorrect!";
        resultColor = Colors.red;
        if (userId != null) {
          context.read<ProfileBloc>().add(UpdateLives(userId, lives));
        }
      }
    });
    _nextAfterDelay();
  }

  void _nextAfterDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    if (lives <= 0 || current == widget.questions.length - 1) {
      _finishQuiz();
      return;
    }
    setState(() {
      current++;
      answer = "";
      resultText = null;
    });
    answerBoxKey.currentState?.clear();
    _resetTimer();
  }

  void _finishQuiz() {
    timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => TestPage3(
          correct: score,
          wrong: widget.questions.length - score,
          reward: score ~/ 2,
          answerReviews: answerReviews,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[current];
    final progress = (timeLeft.toDouble() / widget.timePerQuestion).clamp(0.0, 1.0);

    return Scaffold(
      appBar: _buildAppBar(progress),
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
              const SizedBox(height: 16),
            ],
          ),
          if (resultText != null)
            Positioned(
              top: 250,
              child: Text(
                resultText!,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
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
        onPressed: (resultText == null && timeLeft > 0) ? checkAnswer : null,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(double progress) {
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
