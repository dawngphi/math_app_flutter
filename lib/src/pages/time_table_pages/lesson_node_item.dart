import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/lesson_node_model.dart';

class LessonNodeItem extends StatefulWidget {
  final LessonNode lesson;
  final bool zigzag;


  LessonNodeItem({super.key, required this.lesson, this.zigzag = true, });

  @override
  State<StatefulWidget> createState() => LessonNodeItemState();

}

class LessonNodeItemState extends State<LessonNodeItem> {
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(right: 50.w, left: 40.w,),
     padding: EdgeInsets.all(2.w),
     child:Row(
       mainAxisSize: MainAxisSize.min,
       children: [
         if (widget.zigzag) ...[
           Padding(
             padding: EdgeInsets.only(bottom: 10.w),
             child: Image.asset(widget.lesson.iconPath, width: 76.w, height: 76.w),
           ),
         ] else ...[
           Padding(
             padding: const EdgeInsets.only(bottom: 50),
             child: Image.asset(widget.lesson.iconPath, width: 76.w, height: 76.w),
           ),
         ]
       ],
     ),
   );
  }

}