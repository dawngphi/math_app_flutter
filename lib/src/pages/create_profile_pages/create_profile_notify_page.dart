import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../l10n/app_localizations.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
import '../../blocs/user_profile_bloc/profile_state.dart';
import '../../routes/routes.dart';
import 'button_next.dart';
import 'create_profile_splash_page.dart';

class CreateProfileNotifyPage extends StatelessWidget {
  void _onNextPressed(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.createProfileSplash);
  }
  @override
  Widget build(BuildContext context) {
    final features = [
      AppLocalizations.of(context)!.reminders,
      AppLocalizations.of(context)!.progressupdates,
      AppLocalizations.of(context)!.usefulinformation,
      AppLocalizations.of(context)!.motivation,
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
                  AppLocalizations.of(context)!.next,
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20.sp,
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
          padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 180.h),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.createprofile,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3AAFFF),
                ),
              ),
              SizedBox(height: 10.h),
              Image.asset("assets/images/step_icon_3.png", width: 280.w),
              SizedBox(height: 30.h),
              Image.asset("assets/images/image_math_2.png"),
              SizedBox(height: 40.h),
              Text(
                AppLocalizations.of(context)!.notifications,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF003384),
                ),
              ),
              SizedBox(height: 10.h),
              ...features.map(
                (f) => Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/select_icon_2.png", width: 30.w),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Text(
                          f,
                          style: TextStyle(
                            fontSize: 16.sp,
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
