import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/screens/home/data/model/products_model.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';

class BoxProduct extends StatelessWidget {
  const BoxProduct({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 164 / 375,
      height: 200,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: AppColor.shadowColor, blurRadius: 10)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 156 / 375,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Image.network(
                    product.image,
                    ),
                ),
              ),
              SizedBox(height: 4),
              TextComicNeue(
                text: '${product.price} LE',
                size: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.text,
              ),
              SizedBox(height: 4),
              TextComicNeue(
                text: product.title,
                
                size: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.text,
              ),
              SizedBox(height: 4),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: AppColor.purple, width: 2),
                      ),
                    ),
                    child: TextComicNeue(
                      text: 'Add',
                      size: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.text,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
