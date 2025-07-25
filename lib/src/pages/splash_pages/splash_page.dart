import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart';

import '../../../l10n/app_localizations.dart'; // Đảm bảo import đúng đường dẫn

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
    final isTablet = 1.sw >= 600.w;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                        width: isTablet ? 0.2.sw : 0.6.sw,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              Align(
                alignment: Alignment(0, 0.18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StrokeText(
                      text: AppLocalizations.of(context)!.loading,
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        fontSize: 32.sp,
                        fontFamily: 'Fredoka',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(-4.w, 2.h),
                            blurRadius: 4.r,
                            color: Color(0xFFBE00B7),
                          ),
                        ],
                      ),
                      strokeColor: Color(0xFFFB2FF4),
                      strokeWidth: 4.r,
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 0.4.sw : 0.37.sw,
                      ),
                      child: LinearProgressIndicator(
                        minHeight: 10.h,
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