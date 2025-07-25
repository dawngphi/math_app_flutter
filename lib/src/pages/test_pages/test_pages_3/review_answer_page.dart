import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerReview {
  final String questionText;
  final int userAnswer;
  final int correctAnswer;
  AnswerReview({
    required this.questionText,
    required this.userAnswer,
    required this.correctAnswer,
  });
}

class ReviewAnswerPage extends StatelessWidget {
  final List<AnswerReview> answerReviews;
  const ReviewAnswerPage({Key? key, required this.answerReviews})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Answers'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Question',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Your answer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Correct answer',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: answerReviews.map((review) {
                      final isCorrect =
                          review.userAnswer == review.correctAnswer;
                      return DataRow(
                        cells: [
                          DataCell(Center(child: Text(review.questionText))),
                          DataCell(
                            Center(
                              child: Text(
                                review.userAnswer.toString(),
                                style: TextStyle(
                                  color: isCorrect ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                review.correctAnswer.toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
