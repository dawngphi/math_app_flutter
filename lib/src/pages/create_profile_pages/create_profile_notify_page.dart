import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
import '../../blocs/user_profile_bloc/profile_state.dart';
import 'button_next.dart';
import 'create_profile_splash_page.dart';

class CreateProfileNotifyPage extends StatelessWidget {
  void _onNextPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateProfileSplashPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final features = [
      'Reminders to learn: Kids stay on track.',
      'Progress updates: Track grades, skills.',
      'Useful information: Get updates, offers.',
      'Motivation to learn: Rewards, fun activities.',
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          final isOn = state.notificationsEnabled ?? false;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonNext(
                title: isOn ? "Turn Notification Off" : "Turn Notification On",
                onPressed: () {
                  context.read<ProfileBloc>().add(
                    ToggleNotification(!isOn),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  _onNextPressed(context);
                },
                child: Text(
                  "Skips this now",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF003384),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Text(
                "Create Profile",
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3AAFFF),
                ),
              ),
              SizedBox(height: 10),
              Image.asset("assets/images/step_icon_3.png", width: 280),
              SizedBox(height: 30),
              Image.asset("assets/images/image_math_2.png"),
              SizedBox(height: 40),
              Text(
                "Notifications",
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF003384),
                ),
              ),
              SizedBox(height: 10),
              ...features.map(
                (f) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/select_icon_2.png", width: 30),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          f,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Fredoka',
                            color: Color(0xFF003384),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
