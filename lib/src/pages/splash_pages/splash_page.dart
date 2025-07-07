import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/images/image_math_3.png",
                    width: 250,
                    height: 134,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StrokeText(
                text: "Loading...",
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Fredoka',
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(-4, 2),
                      blurRadius: 4,
                      color: Color(0xFFBE00B7),
                    ),
                  ],
                ),
                strokeColor: Color(0xFFFB2FF4),
                strokeWidth: 4,
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF003384)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
