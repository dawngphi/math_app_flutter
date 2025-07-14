import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonNode {
  final String title;
  final String iconPath;
  LessonNode({required this.title, required this.iconPath});
}
final List<LessonNode> lessons = [
  LessonNode(title: 'Lesson 1', iconPath: 'assets/images/lesson1.png'),
  LessonNode(title: 'Lesson 2', iconPath: 'assets/images/lesson2.png'),
  LessonNode(title: 'Lesson 3', iconPath: 'assets/images/lesson3.png'),
  LessonNode(title: 'Lesson 4', iconPath: 'assets/images/lesson4.png'),
  LessonNode(title: 'Lesson 5', iconPath: 'assets/images/lesson5.png'),
  LessonNode(title: 'Lesson 6', iconPath: 'assets/images/lesson6.png'),
  LessonNode(title: 'Lesson 7', iconPath: 'assets/images/lesson7.png'),
  LessonNode(title: 'Lesson 8', iconPath: 'assets/images/lesson8.png'),
  LessonNode(title: 'Lesson 9', iconPath: 'assets/images/lesson9.png'),
  LessonNode(title: 'Lesson 10', iconPath: 'assets/images/lesson10.png'),
];
final List<Offset> lessonPositionsFraction = [
  Offset(0.05, 0.07),
  Offset(0.55, 0.13),
  Offset(0.05, 0.24),
  Offset(0.55, 0.32),
  Offset(0.05, 0.43),
  Offset(0.55, 0.52),
  Offset(0.05, 0.60),
  Offset(0.55, 0.67),
  Offset(0.05, 0.75),
  Offset(0.30, 0.86),
];
final List<Offset> lessonPositions = [
  Offset(0.w, 120.h),
  Offset(200.w, 220.h),
  Offset(0.w, 290.h),
  Offset(210.w, 380.h),
  Offset(0.w, 510.h),
  Offset(210.w, 620.h),
  Offset(0.w, 720.h),
  Offset(210.w, 800.h),
  Offset(0.w, 890.h),
  Offset(120.w, 1010.h),
];