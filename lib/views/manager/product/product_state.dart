part of 'product_cubit.dart';


sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  ProductModel productModel;
  ProductLoaded(
    this.productModel,
  );
}
