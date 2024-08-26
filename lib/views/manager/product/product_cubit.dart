

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../utils/constants.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  ProductModel? productModel;
  Dio dio = Dio();
  Future<void> getcontent() async {
    final response = await dio.get(url + product);
    productModel = ProductModel.fromJson(response.data);
    emit(ProductLoaded(productModel!));
  }
}
