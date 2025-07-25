import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectChallengeItem extends StatefulWidget {
  final String selectedOperation;
  final Function(String) onChanged;

  const SelectChallengeItem({
    Key? key,
    required this.selectedOperation,
    required this.onChanged,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => SelectChallengeItemState();

}

class SelectChallengeItemState extends State<SelectChallengeItem> {
  final List<Map<String, dynamic>> operations = [
    {'icon': "assets/images/plus_icon2.png", 'value': '+'},
    {'icon': "assets/images/minus_icon2.png", 'value': '-'},
    {'icon': "assets/images/multiplication_sign_icon2.png", 'value': 'x'},
    {'icon': "assets/images/division_sign_icon2.png", 'value': '÷'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xFFF6FBFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4.w,
                height: 28.h,
                decoration: BoxDecoration(
                  color: Color(0xFF42A5F5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              SizedBox(width: 30),
              Text("Select Challenge", style: TextStyle(fontSize: 20.sp, fontFamily: 'Fredoka'),)
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: operations.map((op) {
              final isSelected = widget.selectedOperation == op['value'];
              return GestureDetector(
                onTap: () => widget.onChanged(op['value']),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Color(0xFF42A5F5) : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(op['icon'], width: 68.w,),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

}