import 'package:flutter/material.dart';

class SettingItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingItemState();
  
}

class SettingItemState extends State<SettingItem>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/ad_icon.png", width:50,)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/sound_icon.png", width:50,)),
        IconButton(onPressed: (){}, icon: Image.asset("assets/images/setting_icon.png", width:50,)),
      ],
    );
  }
  
}