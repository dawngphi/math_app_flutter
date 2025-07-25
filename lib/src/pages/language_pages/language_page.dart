import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/language_bloc/language_bloc.dart';
import 'package:math_app/src/blocs/language_bloc/language_event.dart';
import 'package:math_app/src/blocs/language_bloc/language_state.dart';
import 'package:math_app/src/pages/language_pages/language_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  int selectedIndex = 0;
  final List<Map<String, String>> languages = [
    {"icon": "assets/images/england_icon.png", "name": "English"},
    {"icon": "assets/images/vietnam_icon.png", "name": "Việt Nam"},
  ];
  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selected_language_index') ?? 0;
    });
  }

  Future<void> _saveSelectedLanguage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected_language_index', index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                return ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    return LanguageItem(
                      iconPath: languages[index]["icon"]!,
                      languageName: languages[index]["name"]!,
                      isSelected: state.selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        _saveSelectedLanguage(index);
                        context.read<LanguageBloc>().add(SelectLanguageEvent(index));
                        // Navigator.pop(context);
                      },
                    );
                  },
                );
              }
          )
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Language",
        style: TextStyle(
          fontFamily: 'Fredoka',
          fontSize: 24,
          color: Color(0xFF3AAFFF),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {Navigator.pushNamed(context, AppRoutes.home);},
          icon: Image.asset("assets/images/select_icon_3.png", width: 25),
        ),
      ],
    );
  }
}
