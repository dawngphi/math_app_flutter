import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerBoxItem extends StatefulWidget {
  final void Function(String) onChanged;
  const AnswerBoxItem({required this.onChanged, super.key});

  @override
  State<AnswerBoxItem> createState() => AnswerBoxItemState();
}

class AnswerBoxItemState extends State<AnswerBoxItem> {
  final List<TextEditingController> controllers = List.generate(3, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(3, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addListener(_onChanged);
    }
  }
  void clear() {
    for (final c in controllers) {
      c.clear();
    }
    focusNodes[0].requestFocus();
  }


  void _onChanged() {
    String answer = controllers.map((c) => c.text).join();
    widget.onChanged(answer);
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (i) {
          return Container(
            width: 90.w,
            height: 130.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/answer_box.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: TextField(
                controller: controllers[i],
                focusNode: focusNodes[i],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                onChanged: (val) {
                  if (val.isEmpty && i > 0) {
                    // Nếu ô hiện tại rỗng, chuyển focus về ô trước
                    focusNodes[i - 1].requestFocus();
                    // Xóa ký tự ở ô trước nếu có
                    if (controllers[i - 1].text.isNotEmpty) {
                      controllers[i - 1].clear();
                    }
                  } else if (val.length == 1 && i < 2) {
                    // Nếu nhập đủ 1 ký tự, chuyển focus sang ô tiếp theo
                    focusNodes[i + 1].requestFocus();
                  }
                  _onChanged();
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}