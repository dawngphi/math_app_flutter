import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/user_profile_bloc/profile_bloc.dart';
import '../../blocs/user_profile_bloc/profile_event.dart';
import 'age_item.dart';
import 'button_next.dart';
import 'create_profile_notify_page.dart';

class CreateProfileAgePage extends StatefulWidget {
  const CreateProfileAgePage({super.key});

  @override
  State<CreateProfileAgePage> createState() => CreateProfileAgePageState();
}

class CreateProfileAgePageState extends State<CreateProfileAgePage> {
  String? selectedAge;

  final List<String> ageRanges = [
    "1-4",
    "5-8",
    "9-11",
    "12-15",
    "16-19",
    "20+",
  ];

  void _onAgeSelected(String age) {
    setState(() {
      selectedAge = age;
    });
    context.read<ProfileBloc>().add(SelectAgeRange(age));
  }
  void _onNextPressed() {
    if (selectedAge != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CreateProfileNotifyPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your age!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonNext(title: "Next", onPressed: _onNextPressed,),
      body: Padding(
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
            Image.asset("assets/images/step_icon_2.png", width: 280),
            SizedBox(height: 20),
            Text(
              "Your Age",
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3AAFFF),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: AgeItem(
                ageRanges: ageRanges,
                selectedAge: selectedAge,
                onSelected: _onAgeSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}