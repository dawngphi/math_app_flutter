import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToPlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 4.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF42A5F5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Step 1: Preparation",
                    style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                '• Choose the operations: Addition (+), subtraction (-), multiplication (*), division (/) or all of them.'
                    '\n• Choose the difficulty level: Limit the number range from 1 to 1000.'
                    '\n• Choose the time for each calculation.',
                style: TextStyle(fontSize: 14.sp, fontFamily: 'Fredoka'),
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Container(
                    width: 4.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF42A5F5),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Step 2: Play",
                    style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                '• Each player takes turns choosing a calculation.'
                    '\n• At the same time, both players calculate the result of the chosen calculation within the specified time.'
                    '\n• The player who answers correctly first will be awarded a point and move on to the next calculation.'
                    '\n• The game ends when 1 player reaches 10 points first.',
                style: TextStyle(fontSize: 14.sp, fontFamily: 'Fredoka'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: Text(
        "How to play",
        style: TextStyle(fontSize: 16.sp, fontFamily: 'Fredoka'),
      ),
      centerTitle: true,
    );
  }

}