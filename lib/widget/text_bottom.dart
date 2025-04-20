import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/core/color.dart';

class DefultTextBottom extends StatelessWidget {
  final String data;
  final Color color;
  final double size;
  final Function()? onPressed;
  final FontWeight fontWeight;
  const DefultTextBottom({
    super.key,
    required this.data,
    required this.color,
    required this.size,
    required this.fontWeight, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          data,
          style: TextStyle(
            fontSize: size,
            fontFamily: 'Comic Neue',
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }
}
