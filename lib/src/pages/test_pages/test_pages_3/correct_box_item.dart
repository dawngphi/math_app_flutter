import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CorrectBoxItem extends StatelessWidget {
  final Color color;
  final String image;
  final int number;
  final String title;


  CorrectBoxItem({required this.color, required this.image, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       Container(
         width: 105.w,
         padding: EdgeInsets.only(top: 5.w),
         decoration: BoxDecoration(
           color: color,
           borderRadius: BorderRadius.circular(20.r),
         ),
         child: Column(
           children: [
             Text(title, style: TextStyle(fontSize: 24.sp, color: Colors.white),),
             Container(
               margin: EdgeInsets.all(4.r),
               padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.w),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(15.r),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset(image, width: 16.w,),
                   SizedBox(width: 5.w),
                   Text(number.toString(), style: TextStyle(fontSize: 20.sp, color: color, fontFamily: 'Fredoka'),)
                 ],
               ),
             )
           ],
         ),
       ),

     ],
   );
  }

}