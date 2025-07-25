import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/l10n/app_localizations.dart';
import 'package:math_app/src/pages/create_profile_pages/button_next.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
import '../../routes/routes.dart';
import 'create_profile_age_page.dart';
import 'gender_item.dart';

class CreateProfileGenderPage extends StatefulWidget {
  @override
  State<CreateProfileGenderPage> createState() =>
      _CreateProfileGenderPageState();
}

class _CreateProfileGenderPageState extends State<CreateProfileGenderPage> {
  String? selectedGender;
  void _onNextPressed() {
    if (selectedGender != null) {
      Navigator.pushNamed(context, AppRoutes.createProfileAge);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your gender!')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(title: AppLocalizations.of(context)!.next, onPressed: _onNextPressed,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Image.asset("assets/images/step_icon.png", width: 280.w),
              SizedBox(height: 30.h),
              Image.asset("assets/images/image_math.png", width: 300.w ),
              SizedBox(height: 40.h),
              Text(
                AppLocalizations.of(context)!.gender,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF003384),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenderItem(
                    color: Color(0xFF3AAFFF),
                    icon: Image.asset("assets/images/boy_icon.png", width: 25.w),
                    label:AppLocalizations.of(context)!.boy,
                    selected: selectedGender == "boy",
                    onTap: () {
                      setState(() {
                        selectedGender = "boy";
                      });
                      BlocProvider.of<ProfileBloc>(
                        context,
                      ).add(SelectGender("boy"));
                    },
                  ),
                  GenderItem(
                    color: Color(0xFFFF86E9),
                    icon: Image.asset("assets/images/girl_icon.png", width: 25.w),
                    label: AppLocalizations.of(context)!.girl,
                    selected: selectedGender == "girl",
                    onTap: () {
                      setState(() {
                        selectedGender = "girl";
                      });
                      BlocProvider.of<ProfileBloc>(
                        context,
                      ).add(SelectGender("girl"));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
