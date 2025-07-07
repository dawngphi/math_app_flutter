import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ButtonNext({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3AAFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 5,
          shadowColor: Color(0xFF027EBA).withValues(alpha: 1),
        ),

        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Fredoka',
          ),
        ),
      ),
    );
  }
}
