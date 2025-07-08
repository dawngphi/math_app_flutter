import 'package:flutter/material.dart';

class TimeTableItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait = constraints.maxHeight > constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        return Container(
          width: screenWidth * 1,
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF2CAA4C),
            gradient: LinearGradient(
              colors: [
                Color(0xFF84DC12),
                Color(0xFF2CAA4C),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Times Tables", style: TextStyle(fontSize: 24, fontFamily: 'Fredoka', color: Colors.white)),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Row(
                    children: [
                      Image.asset("assets/images/start_icon.png",width: 30),
                      SizedBox(width: 10),
                      Text("Start", style: TextStyle(fontSize: 16, fontFamily: 'Fredoka',  color: Color(0xFF3A7B47)),),
                    ],
                  ))

                ],
              ),
              Image.asset("assets/images/time_table_icon.png", width: 190,)
            ],
          ),
        );
      }
    );
  }

}