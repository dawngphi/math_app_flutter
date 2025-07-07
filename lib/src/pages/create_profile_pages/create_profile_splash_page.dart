import 'package:flutter/material.dart';
import '../splash_pages/splash_page.dart';

class CreateProfileSplashPage extends StatefulWidget {
  @override
  _CreateProfileSplashPageState createState() => _CreateProfileSplashPageState();
}

class _CreateProfileSplashPageState extends State<CreateProfileSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/gifs/app_jo.gif", width: 160, height: 160),
            Text(
              "The app is personalizing for you...",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Fredoka',
                color: Color(0xFF003384),
              ),
            ),
          ],
        ),
      ),
    );
  }
}