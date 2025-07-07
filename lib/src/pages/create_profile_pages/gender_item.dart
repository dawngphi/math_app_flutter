import 'package:flutter/material.dart';

class GenderItem extends StatefulWidget {
  final String label;
  final Color color;
  final Widget icon;
  final bool selected;
  final VoidCallback? onTap;
  const GenderItem({
    Key? key,
    required this.label,
    required this.color,
    required this.icon,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => GenderItemState();
}

class GenderItemState extends State<GenderItem> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        // Main button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            elevation: 8,
            shadowColor: Colors.black.withValues(alpha: 0.5),
          ),
          onPressed: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon,
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: const TextStyle(
                  fontFamily: 'Fredoka',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.selected) const SizedBox(width: 24),
            ],
          ),
        ),
        // Notch + Check icon
        if (widget.selected)
          Positioned(
            right: -8,
            top: -8,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Notch (white circle)
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                // Check icon
                Image.asset("assets/images/select_icon.png", width: 15,)
              ],
            ),
          ),
      ],
    );
  }
}
