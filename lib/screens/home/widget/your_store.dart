import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/widget/text_sf_pro_display.dart';

class YourStore extends StatelessWidget {
  const YourStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.hintWhite,
                ),
                child: Center(
                  child: SvgPicture.asset(AppIcons.plus, width: 24, height: 24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextSFProDisplay(
            text: 'Your Story',
            size: 13,
            fontWeight: FontWeight.w400,
            color: AppColor.text,
          ),
        ],
      ),
    );
  }
}
