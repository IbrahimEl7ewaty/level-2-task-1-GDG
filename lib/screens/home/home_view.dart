import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/core/images.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';
import 'package:level_1_task_gdg/widget/text_sf_pro_display.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.all(10),

            child: ClipOval(
              child: Image.asset(
                AppImages.profile,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: TextSFProDisplay(
            text: "Chats",
            size: 30,
            fontWeight: FontWeight.w700,
            color: AppColor.text,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.hintWhite,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: SvgPicture.asset(AppIcons.camera),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.hintWhite,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: SvgPicture.asset(AppIcons.edit),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(children: [
          
        ],),
      ),
    );
  }
}
