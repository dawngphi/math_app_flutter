import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_age_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_gender_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_notify_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_splash_page.dart';
import 'package:math_app/src/pages/duel_pages/duel_page.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart';
import 'package:math_app/src/pages/language_pages/language_page.dart';
import 'package:math_app/src/pages/splash_pages/splash_page.dart';
import 'package:math_app/src/pages/test_pages/test_page.dart';
import 'package:math_app/src/pages/time_table_pages/time_table_page.dart';
import 'package:path/path.dart';

import '../blocs/test_config_bloc/test_config_bloc.dart';
import '../pages/test_pages/test_pages_2/test_page_2.dart';

class AppRoutes {
  static const String home = '/home';
  static const String createProfileGender = '/create_profile/gender';
  static const String createProfileAge = '/create_profile/age';
  static const String createProfileNotify = '/create_profile/notify';
  static const String createProfileSplash = '/create_profile/splash';
  static const String splash = '/splash_page';
  static const String language = '/language';
  static const String duelpage = '/duelpage';
  static const String timetablepage = '/timetablepage';
  static const String testpage = '/testpage';



  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    createProfileGender: (context) => CreateProfileGenderPage(),
    createProfileAge: (context) => CreateProfileAgePage(),
    createProfileNotify: (context) => CreateProfileNotifyPage(),
    createProfileSplash: (context) => CreateProfileSplashPage(),
    splash: (context) => SplashPage(),
    language: (context) => LanguagePage(),
    duelpage: (context) => DuelPage(),
    timetablepage: (context) => TimeTablePage(),
    testpage: (context) => BlocProvider(
      create: (_) => TestConfigBloc(),
      child: TestPage(),
    ),
  };
}
