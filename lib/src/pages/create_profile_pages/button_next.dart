import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonNext extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ButtonNext({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 56.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3AAFFF),
          padding: EdgeInsets.all(6.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          elevation: 5,
          shadowColor: Color(0xFF027EBA).withValues(alpha: 1),
        ),

        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 32.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Fredoka',
          ),
        ),
      ),
    );
  }
}
