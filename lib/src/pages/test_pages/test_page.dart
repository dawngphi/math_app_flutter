import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/test_pages/select_challenge_item.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestPageState();

}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
          child:Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                  SelectChallengeItem(),
              ],
            ),
          )
      ),
    );
  }

  _buildAppbar () {
   return AppBar(
     elevation: 0,
     backgroundColor: Colors.transparent,
     leading: IconButton(onPressed: () {}, icon: Image.asset("assets/images/back_icon2.png",)),
     title: Text("Test", style: TextStyle(fontSize: 24, fontFamily: 'Fredoka'),),
     centerTitle: true,
     actions: [
       IconButton(onPressed: () {}, icon: Image.asset("assets/images/question_icon.png"))
     ],
    );
  }

}