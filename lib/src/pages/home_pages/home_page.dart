import 'package:flutter/material.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SettingItem(),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/home_background.png",
                    fit:BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset("assets/images/image_math_3.png", width: screenWidth * 0.60),
                        SizedBox(height: 90),
                        TimeTableItem(),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DuelItem(title: "Duel", titleMath: "7 x 8 ÷ 9", titleButton: "Play", titleColor: Color(0xFFF3308E), backgroundColor: Color(0xFFFF7DC3)),
                            DuelItem(title: "Test", titleMath: "9 + 1 = ?", titleButton: "Start", titleColor: Color(0xFF0B85D7), backgroundColor: Color(0xFF17C9F3)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SettingItem(),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/home_background.png",
                    fit:BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/image_math_3.png", width: screenWidth * 0.60),
                        SizedBox(height: 90),
                        SizedBox(
                          width: screenWidth * 0.3,
                          child: TimeTableItem(),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DuelItem(title: "Duel", titleMath: "7 x 8 ÷ 9", titleButton: "Play", titleColor: Color(0xFFF3308E), backgroundColor: Color(0xFFFF7DC3)),
                            SizedBox(width: 20),
                            DuelItem(title: "Test", titleMath: "9 + 1 = ?", titleButton: "Start", titleColor: Color(0xFF0B85D7), backgroundColor: Color(0xFF17C9F3)),
                          ],
                        )
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
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/images/england_icon.png',
          width: 48,
          height: 48,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/tim_icon.png", width: 30),
              ),
              Text(
                "3",
                style: TextStyle(
                  color: Color(0xFFFC4F4F),
                  fontFamily: 'Fredoka',
                  fontSize: 25,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/plus_icon.png", width: 25),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
