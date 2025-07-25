import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSettingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 343.w,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: const Color(0xFF4DD0FF),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Setting',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Fredoka',
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _SettingButton(text: 'Rate us', onTap: () {/* TODO: Xử lý */}),
              SizedBox(height: 16.h),
              _SettingButton(text: 'Share app', onTap: () {/* TODO: Xử lý */}),
              SizedBox(height: 16.h),
              _SettingButton(text: 'Contact us', onTap: () {/* TODO: Xử lý */}),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: 95.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF6DD400),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.r,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      fontFamily: 'Fredoka',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _SettingButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _SettingButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 178.w,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF4DD0FF),
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            fontFamily: 'Fredoka',
          ),
        ),
      ),
    );
  }
}