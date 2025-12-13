part of 'fetch_products_cubit.dart';

@immutable
sealed class FetchProductsState {}

final class FetchProductsInitial extends FetchProductsState {}

final class FetchProductsLoading extends FetchProductsState {}

final class FetchProductsSuccess extends FetchProductsState {
  final ProductsResponse response;

  FetchProductsSuccess(this.response);

  List<ProductModel> get products => response.products;
  int get total => response.total;
  int get skip => response.skip;
  int get limit => response.limit;

  // pagination helpers
  bool get hasMore => (skip + limit) < total;
  int get nextPageSkip => skip + limit;
  int get currentPage => (limit > 0) ? (skip ~/ limit) + 1 : 1;
  int get totalPages => (limit > 0) ? (total / limit).ceil() : 1;
}

final class FetchProductsLoadingMore extends FetchProductsState {
  final ProductsResponse previousResponse;

  FetchProductsLoadingMore(this.previousResponse);

  List<ProductModel> get previousProducts => previousResponse.products;
  bool get previousHasMore =>
      (previousResponse.skip + previousResponse.limit) < previousResponse.total;
  int get previousNextPageSkip =>
      previousResponse.skip + previousResponse.limit;
}

final class FetchProductsFailure extends FetchProductsState {
  final String message;

  FetchProductsFailure(this.message);
}

final class FetchProductsLoadMoreFailure extends FetchProductsState {
  final String message;
  final ProductsResponse previousResponse;

  FetchProductsLoadMoreFailure(this.message, this.previousResponse);
}
