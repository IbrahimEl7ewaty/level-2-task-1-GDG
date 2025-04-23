import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/core/images.dart';
import 'package:level_1_task_gdg/screens/home/widget/image_my_frindes.dart';
import 'package:level_1_task_gdg/screens/home/widget/online.dart';
import 'package:level_1_task_gdg/widget/text_sf_pro_display.dart';

class MyFriends extends StatelessWidget {
  final String image;
  final String textName;
  final String massge;
  const MyFriends({
    super.key,
    required this.image,
    required this.textName,
    required this.massge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColor.white),
      child: Row(
        children: [
          ImageMyFrindes(textImage: image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSFProDisplay(
                text: textName,
                size: 17,
                fontWeight: FontWeight.w500,
                color: AppColor.text,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  TextSFProDisplay(
                    text: massge,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColor.text,
                  ),
                  TextSFProDisplay(
                    text: '.9:00 AM',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.text,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.read),
        ],
      ),
    );
  }
}
