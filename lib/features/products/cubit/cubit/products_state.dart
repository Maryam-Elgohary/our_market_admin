part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class GetProductsLoading extends ProductsState {}

final class GetProductsSuccess extends ProductsState {}

final class GetProductsError extends ProductsState {
  final String message;

  GetProductsError(this.message);
}

final class UploadImageLoading extends ProductsState {}

final class UploadImageSuccess extends ProductsState {}

final class UploadImageError extends ProductsState {
  final String message;

  UploadImageError(this.message);
}

final class EditProductLoading extends ProductsState {}

final class EditProductSuccess extends ProductsState {}

final class EditProductError extends ProductsState {
  final String message;

  EditProductError(this.message);
}
