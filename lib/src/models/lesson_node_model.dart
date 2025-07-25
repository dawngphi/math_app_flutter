import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonNode {
  final String title;
  final String iconPath;
  final bool completed;
  LessonNode({
    required this.title,
    required this.iconPath,
    this.completed = false,
  });
}

final List<LessonNode> lessons = [
  LessonNode(
    title: 'Lesson 1',
    iconPath: 'assets/images/lesson1.png',
    completed: true,
  ),
  LessonNode(
    title: 'Lesson 2',
    iconPath: 'assets/images/lesson2.png',
    completed: false,
  ),
  LessonNode(
    title: 'Lesson 3',
    iconPath: 'assets/images/lesson3.png',
    completed: true,
  ),
  LessonNode(
    title: 'Lesson 4',
    iconPath: 'assets/images/lesson4.png',
    completed: false,
  ),
  LessonNode(title: 'Lesson 5', iconPath: 'assets/images/lesson5.png', completed: true,),
  LessonNode(title: 'Lesson 6', iconPath: 'assets/images/lesson6.png', completed: false,),
  LessonNode(title: 'Lesson 7', iconPath: 'assets/images/lesson7.png', completed: true,),
  LessonNode(title: 'Lesson 8', iconPath: 'assets/images/lesson8.png', completed: false),
  LessonNode(title: 'Lesson 9', iconPath: 'assets/images/lesson9.png', completed: true,),
  LessonNode(title: 'Lesson 10', iconPath: 'assets/images/lesson10.png', completed: false,),
];

final List<Offset> lessonPositionsFraction = [
  Offset(0.07, 0.11),
  Offset(0.65, 0.17),
  Offset(0.07, 0.28),
  Offset(0.65, 0.35),
  Offset(0.072, 0.46),
  Offset(0.65, 0.55),
  Offset(0.07, 0.61),
  Offset(0.65, 0.68),
  Offset(0.072, 0.76),
  Offset(0.43, 0.86),
];

List<Offset> getLessonPositions(double width, double height) {
  return lessonPositionsFraction
      .map((fraction) => Offset(fraction.dx * width, fraction.dy * height))
      .toList();
}
