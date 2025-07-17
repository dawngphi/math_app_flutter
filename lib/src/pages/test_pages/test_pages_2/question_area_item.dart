import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionAreaItem extends StatelessWidget {
  final int number1;
  final int number2;
  final String operation;

  QuestionAreaItem({
    super.key,
    required this.number1,
    required this.number2,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset("assets/images/light_icon.png", width: 30.w),
          SizedBox(height: 8.h),
          Text(
            number1.toString(),
            style: TextStyle(
              fontSize: 60.sp,
              fontFamily: 'Fredoka',
              height: 1.0,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                operation,
                style: TextStyle(
                  fontSize: 40.sp,
                  fontFamily: 'Fredoka',
                  height: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            number2.toString(),
            style: TextStyle(
              fontSize: 40.sp,
              fontFamily: 'Fredoka',
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
