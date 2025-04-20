import 'package:flutter/material.dart';

class TextSFProDisplay extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool? isUnderlined;
  const TextSFProDisplay({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
    this.isUnderlined,
  });

  @override
  /*************  ✨ Windsurf Command 🌟  *************/
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'SF Pro Display',
        fontWeight: fontWeight,
        color: color,
        decoration:
            isUnderlined == true
                ? TextDecoration.underline
                : TextDecoration.none,
        //  decoration: TextDecoration.underline,
      ),
    );
  }

  /*******  9eb74143-3e3c-4fd3-844f-4a065a90da70  *******/
}
