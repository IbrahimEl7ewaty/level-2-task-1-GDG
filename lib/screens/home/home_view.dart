import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/screens/home/data/products_model.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_product.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_scearch.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_user.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  //late Response response;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.white,
                        shape: const CircleBorder(),
                        side: BorderSide(color: AppColor.purple, width: 1),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(AppIcons.arrawBack),
                    ),
                    TextComicNeue(
                      text: 'Popular Product',
                      size: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColor.text,
                    ),
                    BoxUser(iconPath: AppIcons.user),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoxScearch(),
                      SizedBox(height: 20),
                      TextComicNeue(
                        text: 'All Products',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.text,
                      ),

                      FutureBuilder(
                        future: getProdectResponse(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            Response response = snapshot.data;
                            final dynamic data = response.data;
                            List<ProductsModel> products = [];
                            for (var productMap in data) {
                              products.add(ProductsModel.fromMap(productMap));
                            }

                            return SizedBox(
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 164 / 200,
                                    ),
                                itemBuilder: (context, index) {
                                  return BoxProduct(product: products[index]);
                                },
                              ),
                            );
                          }
                        },
                      ),

                      // SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getProdectResponse() async {
  final Dio dio = Dio();
  Future<Response> response = dio.get('https://fakestoreapi.com/products');
  return response;
}
