import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/answer_box_item.dart';
import 'package:math_app/src/pages/test_pages/test_pages_2/question_area_item.dart';

import '../../create_profile_pages/button_next.dart';

class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestPage2State();
}

class TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(title: "Check", onPressed: () {}),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 200.w, height: 4.h, color: Color(0xFF01E2C3)),
              QuestionAreaItem(number1: 622, number2: 22, operation: "-"),
              Container(
                width: double.infinity,
                height: 4.h,
                color: Colors.black,
                margin: EdgeInsets.symmetric(horizontal: 16),
              ),
              AnswerBoxItem(),
            ],
          ),
        ),
      ),
      appBar: _builddAppBar(),
    );
  }

  _builddAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF3AAFFF),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/tim_icon.png", width: 30),
          ),
          Text(
            "x3",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: 'Fredoka',
            ),
          ),
        ],
      ),
      actions: [
        Container(
          width: 230.w, // Thêm dòng này!
          height: 10.h,
          decoration: BoxDecoration(
            color: Color(0xFF4FC3F7), // màu nền thanh progress (xanh nhạt)
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 0.5, // phần trăm (0.0 - 1.0)
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF424242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
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
