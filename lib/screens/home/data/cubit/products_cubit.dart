import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1_task_gdg/screens/home/data/cubit/products_state.dart';
import 'package:level_1_task_gdg/screens/home/data/model/products_model.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  getProdectResponse() async {
    emit(ProductsLoading());
    final Dio dio = Dio();
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');

      final dynamic data = response.data;
      List<ProductsModel> products = [];

      if (data is List) {
        for (var productMap in data) {
          products.add(ProductsModel.fromMap(productMap));
        }
      }

      emit(ProductsSuccess(products: products));
    } catch (e) {
      emit(ProductsError(error: e.toString()));
      print('Error: $e');
    }
  }
}
