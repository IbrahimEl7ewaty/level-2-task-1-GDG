import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.bottomBarL, AppColor.bottomBarR],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          SvgPicture.asset(AppIcons.chat),
          SvgPicture.asset(AppIcons.frindes),
          SvgPicture.asset(AppIcons.stor),
          Spacer(),
        ],
      ),
    );
  }
}
