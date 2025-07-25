import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/question_models/question_model.dart';

class DuelPage2Item extends StatefulWidget {
  final Color color;
  final QuestionModel question;
  final List<int> answers;
  final void Function(int) onAnswer;
  final int score;
  final int? selectedAnswer;
  final int correctAnswer;
  final int timeLeft;
  final int maxTime;

  const DuelPage2Item({
    super.key,
    required this.color,
    required this.question,
    required this.answers,
    required this.onAnswer,
    required this.score,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.timeLeft,
    required this.maxTime,
  });

  @override
  State<StatefulWidget> createState() => DuelPage2ItemState();
}

class DuelPage2ItemState extends State<DuelPage2Item> {
  Color _getAnswerColor(int ans) {
    if (widget.selectedAnswer == null) return widget.color;
    if (ans == widget.correctAnswer && widget.selectedAnswer == ans) {
      return Colors.green;
    }
    if (widget.selectedAnswer == ans && ans != widget.correctAnswer) {
      return Colors.red;
    }
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: Color(0xFFB8E2FF),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(child: Text("${widget.score}", style: TextStyle(color: Colors.white, fontFamily: 'Fredoka', fontSize: 12.sp),)),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                "${widget.question.number1} ${widget.question.operation} ${widget.question.number2} = ?",
                style: TextStyle(
                  fontSize: 48.sp,
                  fontFamily: 'Fredoka',
                  color: widget.color,
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 10.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        heightFactor: widget.timeLeft / widget.maxTime,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 3,
            physics: NeverScrollableScrollPhysics(),
            children: widget.answers.map((ans) => GestureDetector(
              onTap: widget.selectedAnswer == null ? () => widget.onAnswer(ans) : null,
              child: Container(
                decoration: BoxDecoration(
                  color: _getAnswerColor(ans),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "$ans",
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.white,
                    fontFamily: 'Fredoka',
                  ),
                ),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class _AnswerBox extends StatelessWidget {
  final String text;
  final Color color;
  const _AnswerBox({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40.sp,
          color: Colors.white,
          fontFamily: 'Fredoka',
        ),
      ),
    );
  }
}