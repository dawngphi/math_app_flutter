import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageItem extends StatelessWidget {
  final String iconPath;
  final String languageName;
  final bool isSelected;
  final VoidCallback? onTap;

  const LanguageItem({
    Key? key,
    required this.iconPath,
    required this.languageName,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.w, color: Color(0xFFDEDEDE)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(iconPath, width: 30.w, semanticLabel: languageName),
                SizedBox(width: 10.w),
                Text(languageName, style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka', fontWeight: FontWeight.w400)),
              ],
            ),
            isSelected
                ? Image.asset("assets/images/select_icon_5.png", width: 30.w)
                : SizedBox(width: 30.w),
          ],
        ),
      ),
    );
  }
}