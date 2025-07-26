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
    // Khi lives thay đổi (tăng hoặc giảm), cập nhật vào ProfileBloc
    if (lastLives != null && testState.lives != lastLives!) {
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
      appBar: QuizAppBar(
        lives: testState.lives,
        timeLeft: testState.timeLeft,
        maxTimePerQuestion: testState.maxTimePerQuestion,
        ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              QuestionAreaItem(
                number1: q.number1,
                number2: q.number2,
                operation: q.operationSymbol,
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
}

class QuizAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int lives;
  final int timeLeft;
  final int maxTimePerQuestion;

  const QuizAppBar({
    Key? key,
    required this.lives,
    required this.timeLeft,
    required this.maxTimePerQuestion,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _QuizAppBarState createState() => _QuizAppBarState();
}

class _QuizAppBarState extends State<QuizAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctr;

  @override
  void initState() {
    super.initState();
    _ctr = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.maxTimePerQuestion),
    );
    _start();
  }

  @override
  void didUpdateWidget(covariant QuizAppBar old) {
    super.didUpdateWidget(old);
    // Reset timer khi chuyển sang câu hỏi mới (timeLeft được reset về maxTimePerQuestion)
    if (widget.timeLeft == widget.maxTimePerQuestion &&
        old.timeLeft != widget.maxTimePerQuestion) {
      _start();
    }
    // Cập nhật duration nếu maxTimePerQuestion thay đổi
    if (widget.maxTimePerQuestion != old.maxTimePerQuestion) {
      _ctr.duration = Duration(seconds: widget.maxTimePerQuestion);
      _start();
    }
  }

  void _start() {
    _ctr
      ..reset()
      ..reverse(from: 1.0);
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              "x${widget.lives}",
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
          child: AnimatedBuilder(
            animation: _ctr,
            builder: (_, __) {
              return FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _ctr.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF424242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
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
