import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColor.hintWhite,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.search),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColor.hintWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColor.hintWhite, width: 2.0),
          ),
        ),
        style: TextStyle(
          fontSize: 17,
          color: AppColor.hintColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'SF Pro Display',
        ),
      ),
    );
  }
}
