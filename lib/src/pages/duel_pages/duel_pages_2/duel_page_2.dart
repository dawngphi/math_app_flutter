import 'dart:async';
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/duel_pages/duel_pages_2/duel_page_2_item.dart';

import '../../../models/question_models/question_model.dart';

class DuelPage2 extends StatefulWidget {
  final List<QuestionModel> questions;
  final int timePerQuestion;

  const DuelPage2({
    Key? key,
    required this.questions,
    required this.timePerQuestion,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => DuelPage2State();
}

class DuelPage2State extends State<DuelPage2> {
  int currentIndex = 0;
  int player1Score = 0;
  int player2Score = 0;
  bool isGameOver = false;
  int? winner;
  String? message;
  List<List<int>> answersList = [];
  int? selectedAnswerPlayer1;
  int? selectedAnswerPlayer2;
  bool? isCorrectPlayer1;
  bool? isCorrectPlayer2;
  Timer? _timer;
  int timeLeft = 0;

  @override
  void initState() {
    super.initState();
    // Sinh sẵn đáp án cho tất cả câu hỏi để không bị thay đổi khi chọn
    answersList = widget.questions.map((q) => getShuffledAnswers(q)).toList();
    _startTimer();
  }
  void _startTimer() {
    _timer?.cancel();
    setState(() {
      timeLeft = widget.timePerQuestion;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _timer?.cancel();
        _onTimeOut();
      }
    });
  }
  void _onTimeOut() {
    // Nếu chưa ai trả lời đúng thì chuyển câu, không cộng điểm
    if (selectedAnswerPlayer1 == null && selectedAnswerPlayer2 == null) {
      setState(() {
        message = "Hết thời gian!";
      });
      Future.delayed(const Duration(seconds: 1), () {
        if (currentIndex < widget.questions.length - 1) {
          setState(() {
            currentIndex++;
            winner = null;
            message = null;
            selectedAnswerPlayer1 = null;
            selectedAnswerPlayer2 = null;
            isCorrectPlayer1 = null;
            isCorrectPlayer2 = null;
          });
          _startTimer();
        } else {
          setState(() {
            isGameOver = true;
            message = "Hết câu hỏi!";
          });
        }
      });
    }
  }

  List<int> getShuffledAnswers(QuestionModel q) {
    final rand = Random();
    final answers = <int>{q.answer};
    while (answers.length < 4) {
      int delta = rand.nextInt(10) + 1;
      int fake = q.answer + (rand.nextBool() ? delta : -delta);
      if (fake != q.answer && fake > 0) answers.add(fake);
    }
    final list = answers.toList()..shuffle();
    return list;
  }

  void _onAnswer(int player, int answer) {
    if (isGameOver || winner != null) return;
    final q = widget.questions[currentIndex];
    if (player == 1 && selectedAnswerPlayer1 != null) return;
    if (player == 2 && selectedAnswerPlayer2 != null) return;

    setState(() {
      if (player == 1) {
        selectedAnswerPlayer1 = answer;
        isCorrectPlayer1 = answer == q.answer;
      } else {
        selectedAnswerPlayer2 = answer;
        isCorrectPlayer2 = answer == q.answer;
      }
    });

    if (answer == q.answer) {
      setState(() {
        if (player == 1) player1Score++;
        else player2Score++;
        winner = player;
        message = "Người chơi $player trả lời đúng!";
      });
      Future.delayed(Duration(seconds: 1), () {
        if (player1Score >= 10 || player2Score >= 10) {
          setState(() {
            isGameOver = true;
            message = "Người chơi ${player1Score >= 10 ? 1 : 2} thắng chung cuộc!";
          });
          _timer?.cancel();
        } else if (currentIndex < widget.questions.length - 1) {
          setState(() {
            currentIndex++;
            winner = null;
            message = null;
            selectedAnswerPlayer1 = null;
            selectedAnswerPlayer2 = null;
            isCorrectPlayer1 = null;
            isCorrectPlayer2 = null;
          });
          _startTimer();
        } else {
          setState(() {
            isGameOver = true;
            message = "Hết câu hỏi!";
          });
          _timer?.cancel();
        }
      });

    } else {
      setState(() {
        message = "Sai rồi!";
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          if (player == 1) {
            selectedAnswerPlayer1 = null;
            isCorrectPlayer1 = null;
          } else {
            selectedAnswerPlayer2 = null;
            isCorrectPlayer2 = null;
          }
        });
      });
    }
  }

  void _resetGame() {
    setState(() {
      currentIndex = 0;
      player1Score = 0;
      player2Score = 0;
      isGameOver = false;
      winner = null;
      message = null;
      selectedAnswerPlayer1 = null;
      selectedAnswerPlayer2 = null;
      isCorrectPlayer1 = null;
      isCorrectPlayer2 = null;
    });
    _timer?.cancel();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final q = widget.questions[currentIndex];
    final answers = answersList[currentIndex];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(math.pi)
                    ..rotateY(math.pi),
                  child: DuelPage2Item(
                    color: Color(0xFF0072C1),
                    question: q,
                    answers: answers,
                    onAnswer: (ans) => _onAnswer(2, ans),
                    score: player2Score,
                    selectedAnswer: selectedAnswerPlayer2,
                    correctAnswer: q.answer,
                    timeLeft: timeLeft,
                    maxTime: widget.timePerQuestion,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(child: DuelPage2Item(
                  color: Color(0xFF3AAFFF),
                  question: q,
                  answers: answers,
                  onAnswer: (ans) => _onAnswer(1, ans),
                  score: player1Score,
                  selectedAnswer: selectedAnswerPlayer1,
                  correctAnswer: q.answer,
                timeLeft: timeLeft,
                maxTime: widget.timePerQuestion,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
