import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'product_model.dart';

class ProductsResponse {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;

  ProductsResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      products: (json[ProductKeys.products] as List)
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList(),
      total: json[ProductKeys.total] as int,
      skip: json[ProductKeys.skip] as int,
      limit: json[ProductKeys.limit] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.products: products
          .map((product) => product.toJson())
          .toList(),
      ProductKeys.total: total,
      ProductKeys.skip: skip,
      ProductKeys.limit: limit,
    };
  }

  // 🔥 دوال مساعدة للـ Pagination
  bool get hasMore => (skip + products.length) < total;
  int get nextPageSkip => skip + products.length;
  int get currentPage => (skip / limit).floor() + 1;
  int get totalPages => (total / limit).ceil();

  @override
  String toString() {
    return 'ProductsResponse(products: ${products.length}, total: $total, skip: $skip, limit: $limit)';
  }
}
