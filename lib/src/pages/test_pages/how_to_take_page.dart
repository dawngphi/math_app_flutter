import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HowToTakePage extends StatelessWidget {
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
                '• Calculation type (addition, subtraction, multiplication, division, combination)\n'
                '• Number range (1 - 999)\n'
                '• Maximum time 60 seconds/calculation',
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
                    "Step 2: Do the test",
                    style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                '• 20 questions\n• Write the answer in the box \n• Press \"Check\" to see the result and move on to the next question \n• Pay attention to the time limit!',
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
        "How to take the test",
        style: TextStyle(fontSize: 16.sp, fontFamily: 'Fredoka'),
      ),
      centerTitle: true,
    );
  }
}
