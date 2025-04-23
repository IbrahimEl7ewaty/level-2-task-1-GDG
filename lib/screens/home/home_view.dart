import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/core/images.dart';
import 'package:level_1_task_gdg/screens/home/widget/bottom_bar.dart';
import 'package:level_1_task_gdg/screens/home/widget/my_friends.dart';
import 'package:level_1_task_gdg/screens/home/widget/online.dart';
import 'package:level_1_task_gdg/screens/home/widget/search.dart';
import 'package:level_1_task_gdg/screens/home/widget/your_store.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';
import 'package:level_1_task_gdg/widget/text_sf_pro_display.dart';

class HomeView extends StatelessWidget {
  final List _images = [
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
  ];
  final List _names = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Brown",
    "Charlie Davis",
    "Eve Wilson",
    "Frank Miller",
    "Grace Lee",
    "Hannah Taylor",
    "Ian Anderson",
    "Jack White",
    "Kathy Green",
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: ClipOval(
              child: Image.asset(AppImages.profile, fit: BoxFit.cover),
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

        body: Column(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: SearchBox()),

            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _images.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const YourStore();
                  } else {
                    return Online(
                      textImage: _images[index-1],
                      textName: _names[index-1],
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return MyFriends(
                    image: _images[index],
                    textName: _names[index],
                    massge: 'You: Hello, how are you?',
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
