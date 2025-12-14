import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';

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
      products: List<ProductModel>.from(
        (json[ProductKeys.products] ?? []).map((x) => ProductModel.fromJson(x)),
      ),
      total: json[ProductKeys.total] ?? 0,
      skip: json[ProductKeys.skip] ?? 0,
      limit: json[ProductKeys.limit] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.products: products.map((x) => x.toJson()).toList(),
      ProductKeys.total: total,
      ProductKeys.skip: skip,
      ProductKeys.limit: limit,
    };
  }
}

// Helper functions for product operations
class ProductHelper {
  // Sort products by price
  static List<ProductModel> sortByPrice(
    List<ProductModel> products, {
    bool ascending = true,
  }) {
    products.sort(
      (a, b) =>
          ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price),
    );
    return products;
  }

  // Sort products by rating
  static List<ProductModel> sortByRating(
    List<ProductModel> products, {
    bool ascending = true,
  }) {
    products.sort(
      (a, b) => ascending
          ? a.rating.compareTo(b.rating)
          : b.rating.compareTo(a.rating),
    );
    return products;
  }

  // Filter products by category
  static List<ProductModel> filterByCategory(
    List<ProductModel> products,
    String category,
  ) {
    return products
        .where(
          (product) => product.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }

  // Filter products with discount
  static List<ProductModel> filterWithDiscount(List<ProductModel> products) {
    return products.where((product) => product.hasDiscount).toList();
  }

  // Search products by title or description
  static List<ProductModel> searchProducts(
    List<ProductModel> products,
    String query,
  ) {
    final lowerQuery = query.toLowerCase();
    return products
        .where(
          (product) =>
              product.title.toLowerCase().contains(lowerQuery) ||
              product.description.toLowerCase().contains(lowerQuery) ||
              product.brand.toLowerCase().contains(lowerQuery),
        )
        .toList();
  }

  // Calculate average rating from reviews
  static double calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0.0;
    final totalRating = reviews.fold(0, (sum, review) => sum + review.rating);
    return totalRating / reviews.length;
  }
}
