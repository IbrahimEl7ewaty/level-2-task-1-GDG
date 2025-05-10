import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';

class TextForm extends StatelessWidget {
  final String prefixIcon;
  final String hintText;
  final TextEditingController controller;
  const TextForm({super.key, required this.hintText, required this.prefixIcon, required this.controller});

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller:controller ,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SvgPicture.asset(prefixIcon),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        //   borderSide: BorderSide(color: AppColor.purple, width: 2.0),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: AppColor.purple, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: AppColor.purple, width: 1.0),
        ),
      ),
      style: TextStyle(
        fontSize: 16,
        color: AppColor.text,
        fontWeight: FontWeight.w300,
        fontFamily: 'Comic Neue',
      ),
    );
  }
}
