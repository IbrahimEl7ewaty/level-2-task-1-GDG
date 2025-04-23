import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/images.dart';
import 'package:level_1_task_gdg/widget/text_sf_pro_display.dart';

class ImageMyFrindes extends StatelessWidget {
  final String textImage;
  final String? textName;
  const ImageMyFrindes({super.key, required this.textImage,  this.textName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  textImage,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}
