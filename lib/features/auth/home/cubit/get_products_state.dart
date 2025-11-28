part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsLoaded extends GetProductsState {
  final List<ProductModel> products;
  final bool hasMore;

  GetProductsLoaded({required this.products, required this.hasMore});
}

final class GetProductsError extends GetProductsState {
  final String message;

  GetProductsError({required this.message});
}
