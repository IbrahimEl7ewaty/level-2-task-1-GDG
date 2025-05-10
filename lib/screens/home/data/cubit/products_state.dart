import 'package:level_1_task_gdg/screens/home/data/model/products_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductsModel> products;
  ProductsSuccess({required this.products});
}

class ProductsError extends ProductsState {
  final String error;
  ProductsError({required this.error});
}
