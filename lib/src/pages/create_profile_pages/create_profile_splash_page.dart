import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../l10n/app_localizations.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../database/user_database.dart';
import '../../models/user_profile_model.dart';
import '../../routes/routes.dart';
import '../splash_pages/splash_page.dart';

class CreateProfileSplashPage extends StatefulWidget {
  const CreateProfileSplashPage({super.key});

  @override
  _CreateProfileSplashPageState createState() => _CreateProfileSplashPageState();
}

class _CreateProfileSplashPageState extends State<CreateProfileSplashPage> {
  @override
  void initState() {
    super.initState();
    _saveUserProfile();
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushNamed(context, AppRoutes.splash);
      }
    });
  }
  Future<void> _saveUserProfile() async {
    final profileState = context.read<ProfileBloc>().state;
    final userProfile = UserProfileModel(
      gender: profileState.gender ?? '',
      ageRange: profileState.ageRange ?? '',
      notificationsEnabled: profileState.notificationsEnabled ?? false,
    );
    await UserDatabase.instance.createUser(userProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/gifs/app_jo.gif", width: 160.w, height: 160.h),
            Text(
              AppLocalizations.of(context)!.personalizing,
              style: TextStyle(
                fontSize: 20.sp,
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