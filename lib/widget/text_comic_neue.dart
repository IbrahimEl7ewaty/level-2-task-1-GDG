import 'package:flutter/material.dart';

class TextComicNeue extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool? isUnderlined;
  const TextComicNeue({
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Comic Neue',
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
