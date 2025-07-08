import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart'; // Đảm bảo import đúng đường dẫn

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            return Stack(
              children: [
                // Nền
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/splash_background.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          "assets/images/image_math_3.png",
                          width: screenWidth * 0.6,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Align(
                  alignment: Alignment(0, 0.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3,
                        ),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF003384)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    } else {
      return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            return Stack(
              children: [
                // Nền
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/splash_background.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          "assets/images/image_math_3.png",
                          width: screenWidth * 0.2,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Align(
                  alignment: Alignment(0, 0.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      const SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.4,
                        ),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF003384)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
  }
}