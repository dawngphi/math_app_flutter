import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DifficultyItem extends StatelessWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onMinChanged;
  final ValueChanged<int> onMaxChanged;

  const DifficultyItem({
    Key? key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.onMinChanged,
    required this.onMaxChanged,
  }) : super(key: key);


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
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             _buildNumberBox(minValue, onMinChanged),
              Container(
                width: 15.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Color(0xFF007396),
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
             _buildNumberBox(maxValue, onMaxChanged),

           ],
         )
       ],
     ),
   );
  }
  Widget _buildNumberBox(int value, ValueChanged<int> onChanged) {
    return Container(
      width: 122.w,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(width: 1.w, color: Colors.black)
      ),
      child: Center(
        child: TextFormField(
          initialValue: value.toString(),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, color: Color(0xFF007396)),
          decoration: InputDecoration(border: InputBorder.none),
          onChanged: (val) {
            final v = int.tryParse(val) ?? value;
            onChanged(v);
          },
        ),
      ),
    );
  }
}
