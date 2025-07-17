import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/duel_pages/duel_pages_2/duel_page_2_item.dart';

class DuelPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DuelPage2State();
}

class DuelPage2State extends State<DuelPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(math.pi)
                    ..rotateY(math.pi),
                  child: DuelPage2Item(color: Color(0xFF0072C1),),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(child: DuelPage2Item(color: Color(0xFF3AAFFF))),
            ],
          ),
        ),
      ),
    );
  }
}
