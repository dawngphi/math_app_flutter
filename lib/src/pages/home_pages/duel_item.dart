import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuelItem extends StatelessWidget {
  final String title;
  final String titleMath;
  final String titleButton;
  final Color titleColor;
  final Color backgroundColor;
  final VoidCallback onPress;

  DuelItem({
    required this.title,
    required this.titleMath,
    required this.titleButton,
    required this.titleColor,
    required this.backgroundColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Fredoka',
              color: Colors.white,
            ),
          ),
          Text(
            titleMath,
            style: TextStyle(
              fontSize: 32.sp,
              fontFamily: 'Fredoka',
              color: Colors.black12,
            ),
          ),
          ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/start_icon.png",
                  color: titleColor,
                  width: 30.w,
                ),
                SizedBox(width: 5.w),
                Text(
                  titleButton,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Fredoka',
                    color: titleColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
