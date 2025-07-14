import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectChallengeItem extends StatelessWidget {
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
                width: 5.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Color(0xFF42A5F5),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(width: 10),
              Text("Select Challenge", style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),)
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/plus_icon2.png", width: 68.w,),
              Image.asset("assets/images/minus_icon2.png", width: 68.w,),
              Image.asset("assets/images/multiplication_sign_icon2.png", width: 68.w,),
              Image.asset("assets/images/division_sign_icon2.png", width: 68.w,),
            ],
          )
        ],
      ),
    );
  }

}