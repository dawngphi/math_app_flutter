import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/test_pages/test_pages_3/correct_box_item.dart';

import '../../create_profile_pages/button_next.dart';

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonNext(title: "Check", onPressed: () {}),
          SizedBox(height: 20.h),
          ButtonNext(title: "Review answer", onPressed: () {}),
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
                      CorrectBoxItem(color: Color(0xFF2AD352), number: 10, image: "assets/images/select_icon_4.png", title: "Correct",),
                      CorrectBoxItem(color: Color(0xFFFF3E3E), number: 10, image: "assets/images/select_icon_4.png", title: "Wrong",),
                      CorrectBoxItem(color: Color(0xFF2AD352), number: 5, image: "assets/images/select_icon_4.png", title: "Correct",),

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