import 'package:flutter/material.dart';

class AgeItem extends StatelessWidget {
  final List<String> ageRanges;
  final String? selectedAge;
  final Function(String) onSelected;

  const AgeItem({
    Key? key,
    required this.ageRanges,
    required this.selectedAge,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ageRanges.length,
      itemBuilder: (context, index) {
        final age = ageRanges[index];
        final isSelected = age == selectedAge;
        return GestureDetector(
          onTap: () => onSelected(age),
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Color(0xFF3AAFFF) : Color(0xFFC4C4C4),
                width: 2,
              ),
              color: isSelected ? Color(0xFF3AAFFF).withValues(alpha: 0.1) : Colors.white,
            ),
            child: Center(
              child: Text(
                age,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 20,
                  color: isSelected ? Color(0xFF3AAFFF) : Color(0xFF003384),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}