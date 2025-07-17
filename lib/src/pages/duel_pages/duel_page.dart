import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../create_profile_pages/button_next.dart';
import '../test_pages/difficulty_item.dart';
import '../test_pages/select_challenge_item.dart';
import '../test_pages/time_test_item.dart';

class DuelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DuelPageState();
  
}

class DuelPageState extends State<DuelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(title: "Start", onPressed: () {},),
      appBar: _buildAppbar(),
      body: SafeArea(
          child:SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  SelectChallengeItem(),
                  SizedBox(height: 20.h),
                  DifficultyItem(title: "Difficulty (Max number=999)", number1: 1, number2: 10),
                  SizedBox(height: 20.h),
                  TimeTestItem(title: "Time (maximum time=20s)", time: 10,),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          )
      ),
    );
  }

  _buildAppbar () {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {}, icon: Image.asset("assets/images/back_icon2.png")),
      title: Text("Duel", style: TextStyle(fontSize: 24, fontFamily: 'Fredoka'),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/question_icon.png"))
      ],
    );
  }

}
