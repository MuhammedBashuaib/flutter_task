import 'package:flutter_tasck_app/core/api/end_points.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  // Method to calculate the discounted price
  double get discountedPrice {
    return price - (price * discountPercentage / 100);
  }

  // Method to check if product is in stock
  bool get isInStock => availabilityStatus.toLowerCase() == 'in stock';

  // Method to check if product has discount
  bool get hasDiscount => discountPercentage > 0;

  // Factory method to create ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ProductKeys.id] ?? 0,
      title: json[ProductKeys.title] ?? '',
      description: json[ProductKeys.description] ?? '',
      category: json[ProductKeys.category] ?? '',
      price: (json[ProductKeys.price] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json[ProductKeys.discountPercentage] as num?)?.toDouble() ?? 0.0,
      rating: (json[ProductKeys.rating] as num?)?.toDouble() ?? 0.0,
      stock: json[ProductKeys.stock] ?? 0,
      tags: List<String>.from(json[ProductKeys.tags] ?? []),
      brand: json[ProductKeys.brand] ?? '',
      sku: json[ProductKeys.sku] ?? '',
      weight: json[ProductKeys.weight] ?? 0,
      dimensions: Dimensions.fromJson(json[ProductKeys.dimensions] ?? {}),
      warrantyInformation: json[ProductKeys.warrantyInformation] ?? '',
      shippingInformation: json[ProductKeys.shippingInformation] ?? '',
      availabilityStatus: json[ProductKeys.availabilityStatus] ?? '',
      reviews: List<Review>.from(
        (json[ProductKeys.reviews] ?? []).map((x) => Review.fromJson(x)),
      ),
      returnPolicy: json[ProductKeys.returnPolicy] ?? '',
      minimumOrderQuantity: json[ProductKeys.minimumOrderQuantity] ?? 1,
      meta: Meta.fromJson(json[ProductKeys.meta] ?? {}),
      images: List<String>.from(json[ProductKeys.images] ?? []),
      thumbnail: json[ProductKeys.thumbnail] ?? '',
    );
  }

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      ProductKeys.id: id,
      ProductKeys.title: title,
      ProductKeys.description: description,
      ProductKeys.category: category,
      ProductKeys.price: price,
      ProductKeys.discountPercentage: discountPercentage,
      ProductKeys.rating: rating,
      ProductKeys.stock: stock,
      ProductKeys.tags: tags,
      ProductKeys.brand: brand,
      ProductKeys.sku: sku,
      ProductKeys.weight: weight,
      ProductKeys.dimensions: dimensions?.toJson(),
      ProductKeys.warrantyInformation: warrantyInformation,
      ProductKeys.shippingInformation: shippingInformation,
      ProductKeys.availabilityStatus: availabilityStatus,
      ProductKeys.reviews: reviews.map((x) => x.toJson()).toList(),
      ProductKeys.returnPolicy: returnPolicy,
      ProductKeys.minimumOrderQuantity: minimumOrderQuantity,
      ProductKeys.meta: meta?.toJson(),
      ProductKeys.images: images,
      ProductKeys.thumbnail: thumbnail,
    };
  }

  // Copy with method for immutability
  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.sku == sku;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ sku.hashCode;
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  // Calculate volume
  double get volume => width * height * depth;

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json[ProductKeys.width] as num?)?.toDouble() ?? 0.0,
      height: (json[ProductKeys.height] as num?)?.toDouble() ?? 0.0,
      depth: (json[ProductKeys.depth] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.width: width,
      ProductKeys.height: height,
      ProductKeys.depth: depth,
    };
  }

  Dimensions copyWith({double? width, double? height, double? depth}) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  // Check if review is positive (rating >= 4)
  bool get isPositive => rating >= 4;

  // Check if review is negative (rating <= 2)
  bool get isNegative => rating <= 2;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json[ProductKeys.rating] ?? 0,
      comment: json[ProductKeys.comment] ?? '',
      date: DateTime.parse(
        json[ProductKeys.date] ?? DateTime.now().toIso8601String(),
      ),
      reviewerName: json[ProductKeys.reviewerName] ?? '',
      reviewerEmail: json[ProductKeys.reviewerEmail] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.rating: rating,
      ProductKeys.comment: comment,
      ProductKeys.date: date.toIso8601String(),
      ProductKeys.reviewerName: reviewerName,
      ProductKeys.reviewerEmail: reviewerEmail,
    };
  }

  Review copyWith({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return Review(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.parse(
        json[ProductKeys.createdAt] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json[ProductKeys.updatedAt] ?? DateTime.now().toIso8601String(),
      ),
      barcode: json[ProductKeys.barcode] ?? '',
      qrCode: json[ProductKeys.qrCode] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductKeys.createdAt: createdAt.toIso8601String(),
      ProductKeys.updatedAt: updatedAt.toIso8601String(),
      ProductKeys.barcode: barcode,
      ProductKeys.qrCode: qrCode,
    };
  }

  Meta copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return Meta(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      barcode: barcode ?? this.barcode,
      qrCode: qrCode ?? this.qrCode,
    );
  }
}
