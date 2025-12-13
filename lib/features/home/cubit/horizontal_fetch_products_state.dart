part of 'horizontal_fetch_products_cubit.dart';

@immutable
sealed class HorizontalFetchProductsState {}

final class HorizontalFetchProductsInitial
    extends HorizontalFetchProductsState {}

final class HorizontalFetchProductsLoading
    extends HorizontalFetchProductsState {}

final class HorizontalFetchProductsSuccess
    extends HorizontalFetchProductsState {
  final ProductsResponse response;
  HorizontalFetchProductsSuccess(this.response);

  List<ProductModel> get products => response.products;
  int get total => response.total;
  int get skip => response.skip;
  int get limit => response.limit;

  bool get hasMore => (skip + limit) < total;
  int get nextPageSkip => skip + limit;
  int get currentPage => (limit > 0) ? (skip ~/ limit) + 1 : 1;
}

final class HorizontalFetchProductsLoadingMore
    extends HorizontalFetchProductsState {
  final ProductsResponse previousResponse;
  HorizontalFetchProductsLoadingMore(this.previousResponse);

  List<ProductModel> get previousProducts => previousResponse.products;
  bool get previousHasMore =>
      (previousResponse.skip + previousResponse.limit) < previousResponse.total;
  int get previousNextPageSkip =>
      previousResponse.skip + previousResponse.limit;
}

final class HorizontalFetchProductsFailure
    extends HorizontalFetchProductsState {
  final String message;
  HorizontalFetchProductsFailure(this.message);
}

final class HorizontalFetchProductsLoadMoreFailure
    extends HorizontalFetchProductsState {
  final String message;
  final ProductsResponse previousResponse;
  HorizontalFetchProductsLoadMoreFailure(this.message, this.previousResponse);
}
