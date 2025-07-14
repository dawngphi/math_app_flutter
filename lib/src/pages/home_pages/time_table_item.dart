import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait = constraints.maxHeight > constraints.maxWidth;
        return Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Color(0xFF2CAA4C),
            gradient: LinearGradient(
              colors: [
                Color(0xFF84DC12),
                Color(0xFF2CAA4C),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Times Tables",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Fredoka',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("assets/images/start_icon.png", width: 30.w),
                        SizedBox(width: 10.w),
                        Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Fredoka',
                            color: Color(0xFF3A7B47),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/time_table_icon.png",
                width: 150.w,
              ),
            ],
          ),
        );
      },
    );
  }
}