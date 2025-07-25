import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_bloc.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_state.dart';

import '../../models/lesson_node_model.dart' as model;
import 'lesson_node_item.dart';

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessons = model.lessons;
    final positions = model.lessonPositionsFraction;

    return Scaffold(
      backgroundColor: const Color(0xFF01E2C3),
      appBar: _buildAppBar(context, lessons),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: AspectRatio(
              aspectRatio: 370 / 1200,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth;
                  final h = constraints.maxHeight;
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/background_time_table.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      for (var i = 0; i < lessons.length; i++)
                        Positioned(
                          left: positions[i].dx * w - 38.w,
                          top: positions[i].dy * h - 38.h,
                          child: LessonNodeItem(
                            lesson: lessons[i],
                            zigzag: i % 2 == 0,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, List<model.LessonNode> lessons) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF01E2C3),
      leading: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: IconButton(
          icon: Image.asset('assets/images/back_icon.png'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/images/tim_icon.png', width: 30),
          onPressed: () {},
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final lives = state.lives;
            return Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Center(
                child: Text(
                  '$lives',
                  style: TextStyle(
                    color: const Color(0xFFFC4F4F),
                    fontFamily: 'Fredoka',
                    fontSize: 30.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

