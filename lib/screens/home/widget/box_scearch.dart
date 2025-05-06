import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';

class BoxScearch extends StatelessWidget {
  const BoxScearch({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //  Container(width: double.infinity, height: 44,
    // decoration: BoxDecoration(color: Colors.transparent),);
    TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        hintText: 'What are you looking for ?',
        hintStyle: TextStyle(
          fontFamily: 'ComicNeue',
          color: AppColor.hintColor,
          fontSize: 16,
        ),
        prefixIcon: Icon(Icons.search, color: AppColor.purple),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.filterIcon),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.purple, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.purple, width: 1.5),
        ),
      ),
      style: const TextStyle(color: Colors.black54),
    );
  }
}
