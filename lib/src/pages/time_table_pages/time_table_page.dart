import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/time_table_pages/lesson_node_item.dart';

import '../../models/lesson_node_model.dart';

class TimeTablePage extends StatefulWidget {
  late final List<LessonNode> lessons;
  @override
  State<StatefulWidget> createState() => TimeTablePageState();

}
class TimeTablePageState extends State<TimeTablePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color(0xFF01E2C3),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1600.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/background_time_table.png",
                    fit: BoxFit.fill,
                  ),
                ),
                for (int i = 0; i < lessons.length; i++)
                  Positioned(
                    top: lessonPositions[i].dy,
                    left: lessonPositions[i].dx,
                    child: LessonNodeItem(
                      lesson: lessons[i],
                      zigzag: i % 2 == 0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
_buildAppBar () {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF01E2C3),
      leading: IconButton(onPressed: () {}, icon: Image.asset("assets/images/back_icon.png")),
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/tim_icon.png", width: 30,)),
        Text(
          "3",
          style: TextStyle(
            color: Color(0xFFFC4F4F),
            fontFamily: 'Fredoka',
            fontSize: 30,
          ),
        ),
        SizedBox(width: 16.w,)
      ],
    );
}
}