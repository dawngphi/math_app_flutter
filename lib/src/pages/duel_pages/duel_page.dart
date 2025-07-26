import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/duel_pages/duel_pages_2/duel_page_2.dart';

import '../../models/question_models/question_model.dart';
import '../create_profile_pages/button_next.dart';
import '../test_pages/difficulty_item.dart';
import '../test_pages/select_challenge_item.dart';
import '../test_pages/time_test_item.dart';

class DuelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DuelPageState();
  
}

class DuelPageState extends State<DuelPage> {
  String selectedOperation = '+';
  int minNumber = 1;
  int maxNumber = 10;
  int timePerQuestion = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(title: "Start", onPressed: () {
        final questions = generateQuestions(
        operation: selectedOperation,
        min: minNumber,
        max: maxNumber,
        count: 20,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DuelPage2(
            questions: questions,
            timePerQuestion: timePerQuestion,
          ),
        ),
      );},),
      appBar: _buildAppbar(),
      body: SafeArea(
          child:SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  SelectChallengeItem(selectedOperation: selectedOperation,
                    onChanged: (op) {
                      setState(() {
                        selectedOperation = op;
                      });
                    },),
                  SizedBox(height: 20.h),
                  DifficultyItem( title: "Difficulty (Max number=1000)",
                    minValue: minNumber,
                    maxValue: maxNumber,
                    onMinChanged: (v) => setState(() => minNumber = v),
                    onMaxChanged: (v) => setState(() => maxNumber = v),),
                  SizedBox(height: 20.h),
                  TimeTestItem(title: "Time (maximum time=60s)",
                    time: timePerQuestion,
                    onTimeChanged: (v) => setState(() => timePerQuestion = v),),
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
      leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Image.asset("assets/images/back_icon2.png")),
      title: Text("Duel", style: TextStyle(fontSize: 24, fontFamily: 'Fredoka'),),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Image.asset("assets/images/question_icon.png"))
      ],
    );
  }

}
