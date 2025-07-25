import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/test_pages/test_pages_3/correct_box_item.dart';
import 'package:math_app/src/pages/test_pages/test_pages_3/review_answer_page.dart';

import '../../../blocs/test_session_bloc/test_session_state.dart';
import '../../../routes/routes.dart';
import '../../create_profile_pages/button_next.dart';

class TestPage3 extends StatelessWidget {
  final int correct;
  final int wrong;
  final int reward;
  final List<AnswerReview> answerReviews;

  const TestPage3({
    Key? key,
    required this.correct,
    required this.wrong,
    required this.reward,
    required this.answerReviews,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonNext(title: "Continue", onPressed: () {Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
                (route) => false,
          );}),
          SizedBox(height: 20.h),
          ButtonNext(title: "Review answer", onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ReviewAnswerPage(answerReviews: answerReviews),
              ),
            );
          }),
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Center(child: Image.asset("assets/images/image_test_page.png", width: 234.w,)),
                  SizedBox(height: 30.h),
                  Text("Good Job!", style: TextStyle(color: Color(0xFFFFC24D), fontSize: 32.sp, fontFamily: 'Fredoka')),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CorrectBoxItem(color: Color(0xFF2AD352), number: correct, image: "assets/images/select_icon_4.png", title: "Correct",),
                      CorrectBoxItem(color: Color(0xFFFF3E3E), number: wrong, image: "assets/images/wrong_icon.png", title: "Wrong",),
                      CorrectBoxItem(color: Color(0xFF3AAFFF), number: reward, image: "assets/images/reward_icon.png", title: "Reward",),

                    ],
                  ),
                  SizedBox(height: 200.h,)
                ],
              ),
            ),
          )
      ),
    );
  }

}