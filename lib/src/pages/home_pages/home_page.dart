import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/home_pages/duel_item.dart';
import 'package:math_app/src/pages/home_pages/setting_item.dart';
import 'package:math_app/src/pages/home_pages/time_table_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isTablet = 1.sw >= 600.w;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SettingItem(),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/home_background.png",
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: isTablet ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/image_math_3.png",
                        width: 0.6.sw,
                      ),
                      SizedBox(height: 90.h),
                      if (isTablet)
                        SizedBox(
                          width: 0.3.sw,
                          child: TimeTableItem(),
                        )
                      else
                        TimeTableItem(),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: isTablet ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
                        children: [
                          DuelItem(
                            title: "Duel",
                            titleMath: "7 x 8 ÷ 9",
                            titleButton: "Play",
                            titleColor: Color(0xFFF3308E),
                            backgroundColor: Color(0xFFFF7DC3),
                          ),
                          if (isTablet) SizedBox(width: 20.w),
                          DuelItem(
                            title: "Test",
                            titleMath: "9 + 1 = ?",
                            titleButton: "Start",
                            titleColor: Color(0xFF0B85D7),
                            backgroundColor: Color(0xFF17C9F3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/images/england_icon.png',
          width: 48.w,
          height: 48.h,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/tim_icon.png", width: 30.w),
              ),
              Text(
                "3",
                style: TextStyle(
                  color: Color(0xFFFC4F4F),
                  fontFamily: 'Fredoka',
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/plus_icon.png", width: 25.w),
              ),
            ],
          ),
        ),
      ],
    );
  }
}