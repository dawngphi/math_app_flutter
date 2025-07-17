import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeTestItem extends StatelessWidget {
  final String title;
  final double time;

  TimeTestItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xFFF6FBFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4.w,
                height: 27.h,
                decoration: BoxDecoration(
                  color: Color(0xFF42A5F5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              SizedBox(width: 30),
              Text(title, style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),)
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 122.w,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(width: 1.w, color: Colors.black)
                ),
                child: Center(child: Text(time.toString(), style: TextStyle(fontSize: 24.sp, color: Color(0xFF007396)),)),
              ),
              SizedBox(width: 15.sp),
              Text("s", style: TextStyle(fontSize: 32.sp, color: Colors.black, fontWeight: FontWeight.w600),)
            ],
          )
        ],
      ),
    );
  }

}