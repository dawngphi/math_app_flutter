import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuelPage2Item extends StatefulWidget {
  final Color color;

  const DuelPage2Item({super.key, required this.color});
  @override
  State<StatefulWidget> createState() => DuelPage2ItemState();

}

class DuelPage2ItemState extends State<DuelPage2Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: Color(0xFFB8E2FF),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 0.5, // phần trăm (0.0 - 1.0)
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(child: Text("5", style: TextStyle(color: Colors.white, fontFamily: 'Fredoka', fontSize: 12.sp),)),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                '2 × 10 = ?',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontFamily: 'Fredoka',
                  color: widget.color,
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 6.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 3,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _AnswerBox(text: '20', color: widget.color,),
              _AnswerBox(text: '30', color: widget.color,),
              _AnswerBox(text: '40', color: widget.color,),
              _AnswerBox(text: '50', color: widget.color,),
            ],
          ),
        ),
      ],
    );
  }

}

class _AnswerBox extends StatelessWidget {
  final String text;
  final Color color;
  const _AnswerBox({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40.sp,
          color: Colors.white,
          fontFamily: 'Fredoka',
        ),
      ),
    );
  }
}