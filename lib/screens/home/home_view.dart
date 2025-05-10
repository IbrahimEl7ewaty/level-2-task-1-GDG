import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/screens/home/data/cubit/products_cubit.dart';
import 'package:level_1_task_gdg/screens/home/data/cubit/products_state.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_product.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_scearch.dart';
import 'package:level_1_task_gdg/screens/home/widget/box_user.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().getProdectResponse();
    });
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is ProductsLoading) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Loading')));
            } else if (state is ProductsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                          // التحقق من الحالة وعرض المحتوى المناسب
                          if (state is ProductsLoading)
                            const Center(child: CircularProgressIndicator()),
                          if (state is ProductsError)
                            Center(child: Text(state.error.toString())),
                          if (state is ProductsSuccess)
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 160 / 200,
                                  ),
                              itemBuilder: (context, index) {
                                return BoxProduct(
                                  product: state.products[index],
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
