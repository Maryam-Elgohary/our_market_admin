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
