import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
        body: SafeArea(
            child: Text("data")));
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      title: Text("Language", style: TextStyle(fontFamily: 'Fredoka', fontSize: 24, color: Color(0xFF3AAFFF)),),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/images/select_icon_3.png", width: 25),
        ),
      ],
    );
  }
}
