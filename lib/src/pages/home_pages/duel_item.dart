import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuelItem extends StatelessWidget {
  final String title;
  final String titleMath;
  final String titleButton;
  final Color titleColor;
  final Color backgroundColor;

  DuelItem({required this.title, required this.titleMath, required this.titleButton, required this.titleColor, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w,vertical:16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: backgroundColor
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 24.sp, fontFamily: 'Fredoka', color: Colors.white),),
          Text(titleMath, style: TextStyle(fontSize: 24.sp, fontFamily: 'Fredoka', color: Colors.black12),),
          ElevatedButton(onPressed: () {}, child: Row(
            children: [
              Image.asset("assets/images/start_icon.png", color: titleColor,width: 30.w),
              SizedBox(width: 10.w),
              Text(titleButton, style: TextStyle(fontSize: 16.sp, fontFamily: 'Fredoka',  color: titleColor),),
            ],
          ))
        ],
      ),
    );
  }

}