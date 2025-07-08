import 'package:flutter/material.dart';

class DuelItem extends StatelessWidget {
  final String title;
  final String titleMath;
  final String titleButton;
  final Color titleColor;
  final Color backgroundColor;

  DuelItem({required this.title, required this.titleMath, required this.titleButton, required this.titleColor, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical:16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontFamily: 'Fredoka', color: Colors.white),),
          Text(titleMath, style: TextStyle(fontSize: 24, fontFamily: 'Fredoka', color: Colors.black12),),
          ElevatedButton(onPressed: () {}, child: Row(
            children: [
              Image.asset("assets/images/start_icon.png", color: titleColor,width: 30),
              SizedBox(width: 10),
              Text(titleButton, style: TextStyle(fontSize: 16, fontFamily: 'Fredoka',  color: titleColor),),
            ],
          ))
        ],
      ),
    );
  }

}