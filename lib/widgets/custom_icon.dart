import 'package:flutter/material.dart';
import 'package:scribble_notes_app/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kMainColor.withOpacity(0.3),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            color: kMainColor,
            icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
