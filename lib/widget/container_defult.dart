import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';

class ContainerDefult extends StatelessWidget {
  final String iconPath;
  final bool? icons;
  const ContainerDefult({super.key, required this.iconPath, this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.purple.withOpacity(0.2),

            blurRadius: 6,
            offset: const Offset(2, 0), // changes position of shadow
          ),
        ],
      ),

      child: Center(child: SvgPicture.asset(iconPath)),

    );
  }
}


class ContainerDefult1 extends StatelessWidget {
  final String iconPath;
  final bool? icons;
  const ContainerDefult1({super.key, required this.iconPath, this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.purple.withOpacity(0.2),

            blurRadius: 6,
            offset: const Offset(2, 0), // changes position of shadow
          ),
        ],
      ),

      child: Center(child: Image.asset(iconPath)),

    );
  }
}

