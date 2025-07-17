import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerBoxItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: (){} ,child: Image.asset("assets/images/answer_box.png", width: 100.w,)),
          GestureDetector(onTap: (){} ,child: Image.asset("assets/images/answer_box.png", width: 100.w,)),
          GestureDetector(onTap: (){} ,child: Image.asset("assets/images/answer_box.png", width: 100.w,)),
        ],
      ),
    );
  }

}