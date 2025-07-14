import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeItem extends StatelessWidget {
  final List<String> ageRanges;
  final String? selectedAge;
  final Function(String) onSelected;

  const AgeItem({
    Key? key,
    required this.ageRanges,
    required this.selectedAge,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 80.h),
      itemCount: ageRanges.length,
      itemBuilder: (context, index) {
        final age = ageRanges[index];
        final isSelected = age == selectedAge;
        return GestureDetector(
          onTap: () => onSelected(age),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.w),
            padding: EdgeInsets.symmetric(vertical: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? Color(0xFF3AAFFF) : Color(0xFFC4C4C4),
                width: 2.w,
              ),
              color: isSelected ? Color(0xFF3AAFFF).withValues(alpha: 0.1) : Colors.white,
            ),
            child: Center(
              child: Text(
                age,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 20.sp,
                  color: isSelected ? Color(0xFF3AAFFF) : Color(0xFF003384),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}