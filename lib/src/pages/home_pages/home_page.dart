import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/language_bloc/language_bloc.dart';
import 'package:math_app/src/blocs/language_bloc/language_event.dart';
import 'package:math_app/src/blocs/language_bloc/language_state.dart';
import 'package:math_app/src/pages/home_pages/duel_item.dart';
import 'package:math_app/src/pages/home_pages/setting_item.dart';
import 'package:math_app/src/pages/home_pages/time_table_item.dart';

import '../../../l10n/app_localizations.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
import '../../blocs/user_profile_bloc/profile_state.dart';
import '../../database/user_database.dart';
import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void _onDuelPressed() {
    Navigator.pushNamed(context, AppRoutes.duelpage);
  }

  @override
  void initState() {
    super.initState();

    final userId = context.read<ProfileBloc>().state.id;

    if (userId != null) {
      // Nếu đã có ID thì load user theo ID
      UserDatabase.instance.getUserById(userId).then((user) {
        if (user != null) {
          context.read<ProfileBloc>().add(LoadUserProfile(user));
        }
      });
    } else {
      // Nếu chưa có ID thì load user đầu tiên
      UserDatabase.instance.getFirstUser().then((user) {
        if (user != null) {
          context.read<ProfileBloc>().add(LoadUserProfile(user));
        }
      });
    }
  }
  void _onTestPressed() {
    Navigator.pushNamed(context, AppRoutes.testpage);
  }
  @override
  Widget build(BuildContext context) {
    final isTablet = 1.sw >= 600.w;
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        String iconPath;
        if (state.selectedIndex == 0) {
          iconPath = "assets/images/england_icon.png";
        } else if (state.selectedIndex == 1) {
          iconPath = "assets/images/vietnam_icon.png";
        } else {
          iconPath = "assets/images/england_icon.png"; // fallback
        }
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SettingItem(),
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: _buildAppbar(iconPath),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/home_background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        mainAxisAlignment: isTablet
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/image_math_3.png",
                            width: 0.6.sw,
                          ),
                          SizedBox(height: 90.h),
                          if (isTablet)
                            SizedBox(width: 0.3.sw, child: TimeTableItem())
                          else
                            TimeTableItem(),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: isTablet
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceAround,
                            children: [
                              DuelItem(
                                title: AppLocalizations.of(context)!.duel,
                                titleMath: "7 x 8 ÷ 9",
                                titleButton: "Play",
                                titleColor: Color(0xFFF3308E),
                                backgroundColor: Color(0xFFFF7DC3),
                                onPress: _onDuelPressed,
                              ),
                              if (isTablet) SizedBox(width: 20.w),
                              DuelItem(
                                title: AppLocalizations.of(context)!.test,
                                titleMath: "9 + 1 = ?",
                                titleButton: "Start",
                                titleColor: Color(0xFF0B85D7),
                                backgroundColor: Color(0xFF17C9F3),
                                onPress: _onTestPressed,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  AppBar _buildAppbar(iconPath) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.language);
        },
        icon: Image.asset(iconPath, width: 48.w, height: 48.h),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/tim_icon.png", width: 30.w),
              ),

              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Text(
                    "${state.lives}",
                    style: TextStyle(
                      color: Color(0xFFFC4F4F),
                      fontFamily: 'Fredoka',
                      fontSize: 30,
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/plus_icon.png", width: 25.w),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
