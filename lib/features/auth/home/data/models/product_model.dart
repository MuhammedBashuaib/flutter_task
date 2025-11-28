import 'package:flutter_tasck_app/core/api/end_points.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ProductKeys.id] as int? ?? 0,
      title: json[ProductKeys.title] as String? ?? '',
      description: json[ProductKeys.description] as String? ?? '',
      price: json[ProductKeys.price] as int? ?? 0,
      discountPercentage:
          (json[ProductKeys.discountPercentage] as num?)?.toDouble() ?? 0.0,
      rating: (json[ProductKeys.rating] as num?)?.toDouble() ?? 0.0,
      stock: json[ProductKeys.stock] as int? ?? 0,
      brand: json[ProductKeys.brand] as String? ?? '',
      category: json[ProductKeys.category] as String? ?? '',
      thumbnail: json[ProductKeys.thumbnail] as String? ?? '',
      images: List<String>.from(json[ProductKeys.images] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.id: id,
      ProductKeys.title: title,
      ProductKeys.description: description,
      ProductKeys.price: price,
      ProductKeys.discountPercentage: discountPercentage,
      ProductKeys.rating: rating,
      ProductKeys.stock: stock,
      ProductKeys.brand: brand,
      ProductKeys.category: category,
      ProductKeys.thumbnail: thumbnail,
      ProductKeys.images: images,
    };
  }

  // 🔥 دوال مساعدة للواجهة
  double get discountedPrice {
    return price - (price * discountPercentage / 100);
  }

  String get formattedPrice => '\$$price';
  String get formattedDiscountedPrice =>
      '\$${discountedPrice.toStringAsFixed(2)}';

  bool get hasDiscount => discountPercentage > 0;
  bool get isOutOfStock => stock == 0;
  String get stockStatus => isOutOfStock ? 'Out of Stock' : 'In Stock';
  String get ratingFormatted => rating.toStringAsFixed(1);

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: \$$price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

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
    final productsList = json[ProductKeys.products] as List? ?? [];

    return ProductsResponse(
      products: productsList
          .map(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList(),
      total: json[ProductKeys.total] as int? ?? 0,
      skip: json[ProductKeys.skip] as int? ?? 0,
      limit: json[ProductKeys.limit] as int? ?? 0,
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
