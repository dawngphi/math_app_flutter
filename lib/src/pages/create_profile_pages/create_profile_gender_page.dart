import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/pages/create_profile_pages/button_next.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CreateProfileAgePage(),
        ),
      );
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
      floatingActionButton: ButtonNext(title: "Next", onPressed: _onNextPressed,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Image.asset("assets/images/step_icon.png", width: 280),
              SizedBox(height: 30),
              Image.asset("assets/images/image_math.png"),
              SizedBox(height: 40),
              Text(
                "Your Gender",
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF003384),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenderItem(
                    color: Color(0xFF3AAFFF),
                    icon: Image.asset("assets/images/boy_icon.png", width: 25),
                    label: "Boy",
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
                    icon: Image.asset("assets/images/girl_icon.png", width: 25),
                    label: "Girl",
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
