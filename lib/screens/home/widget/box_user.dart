import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';

class BoxUser extends StatelessWidget {
  final String iconPath;
  const BoxUser({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.lightgray,
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.purple, width: 2),
        ),
        child: Center(
          child: ClipOval(
            child: SvgPicture.asset(
              iconPath,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
