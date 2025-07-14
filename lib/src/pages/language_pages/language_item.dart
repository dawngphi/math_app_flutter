import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(16),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15),
       border: Border.all(width: 1, color: Color(0xFFDEDEDE))
     ),
     child: Row(
       children: [
         Image.asset("assets/images/england_icon.png"),
         Text("English", style: TextStyle(fontFamily: "Fredoka", fontSize: 20),)
       ],
     ),
   );
  }

}