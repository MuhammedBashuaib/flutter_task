import 'dart:convert';

// نموذج الاستجابة الرئيسي
class ProductsResponseModel {
  final List<ProductModel> products;
  final int total;
  final int skip;
  final int limit;
  final int? currentPage;
  final int? totalPages;

  ProductsResponseModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
    this.currentPage,
    this.totalPages,
  });

  // حساب الصفحة الحالية وعدد الصفحات
  int get calculatedCurrentPage => (skip ~/ limit) + 1;
  int get calculatedTotalPages => (total / limit).ceil();

  // هل هناك صفحة تالية؟
  bool get hasNextPage => calculatedCurrentPage < calculatedTotalPages;

  // هل هناك صفحة سابقة؟
  bool get hasPreviousPage => calculatedCurrentPage > 1;

  // المصنع لتحويل JSON
  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    final products =
        (json['products'] as List?)
            ?.map((item) => ProductModel.fromJson(item))
            .toList() ??
        [];

    final total = json['total'] ?? 0;
    final skip = json['skip'] ?? 0;
    final limit = json['limit'] ?? 10;
    final currentPage = (skip ~/ limit) + 1;
    final totalPages = (total / limit).ceil();

    return ProductsResponseModel(
      products: products,
      total: total,
      skip: skip,
      limit: limit,
      currentPage: currentPage,
      totalPages: totalPages,
    );
  }

  // التحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'products': products.map((product) => product.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  // دالة نسخ مع إمكانية التعديل
  ProductsResponseModel copyWith({
    List<ProductModel>? products,
    int? total,
    int? skip,
    int? limit,
    int? currentPage,
    int? totalPages,
  }) {
    return ProductsResponseModel(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  String toString() {
    return 'ProductsResponseModel(total: $total, skip: $skip, limit: $limit, products: ${products.length} items)';
  }
}

// نموذج المنتج
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
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
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

  // سعر المنتج بعد الخصم
  double get discountedPrice => price - (price * discountPercentage / 100);

  // هل المنتج مخفض؟
  bool get hasDiscount => discountPercentage > 0;

  // هل المنتج متوفر في المخزون؟
  bool get isInStock => availabilityStatus.toLowerCase() == 'in stock';

  // هل المنتج منخفض المخزون؟
  bool get isLowStock => availabilityStatus.toLowerCase() == 'low stock';

  // هل المنتج غير متوفر؟
  bool get isOutOfStock => availabilityStatus.toLowerCase() == 'out of stock';

  // تقييم المنتج على شكل نجوم (0-5)
  double get starRating => rating;

  // متوسط تقييم المراجعات
  double get averageReviewRating {
    if (reviews.isEmpty) return 0.0;
    final total = reviews.fold(0, (sum, review) => sum + review.rating);
    return total / reviews.length;
  }

  // عدد المراجعات الإيجابية (4-5 نجوم)
  int get positiveReviewsCount => reviews.where((r) => r.rating >= 4).length;

  // عدد المراجعات السلبية (1-2 نجوم)
  int get negativeReviewsCount => reviews.where((r) => r.rating <= 2).length;

  // المصنع لتحويل JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,
      dimensions: Dimensions.fromJson(json['dimensions'] ?? {}),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: List<Review>.from(
        (json['reviews'] ?? []).map((x) => Review.fromJson(x)),
      ),
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      meta: Meta.fromJson(json['meta'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  // التحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  // نسخ مع إمكانية التعديل
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
    return 'ProductModel(id: $id, title: $title, price: \$$price, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id && other.sku == sku;
  }

  @override
  int get hashCode => id.hashCode ^ sku.hashCode;
}

// نموذج الأبعاد
class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  // حساب الحجم
  double get volume => width * height * depth;

  // حجم التعبئة (سم مكعب)
  double get packageVolume => width * height * depth;

  // المصنع لتحويل JSON
  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num?)?.toDouble() ?? 0.0,
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0.0,
    );
  }

  // التحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {'width': width, 'height': height, 'depth': depth};
  }

  // نسخ مع إمكانية التعديل
  Dimensions copyWith({double? width, double? height, double? depth}) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }

  @override
  String toString() {
    return '${width.toStringAsFixed(2)}x${height.toStringAsFixed(2)}x${depth.toStringAsFixed(2)} cm';
  }
}

// نموذج المراجعة
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

  // هل المراجعة إيجابية؟
  bool get isPositive => rating >= 4;

  // هل المراجعة سلبية؟
  bool get isNegative => rating <= 2;

  // هل المراجعة محايدة؟
  bool get isNeutral => rating == 3;

  // الحصول على وقت مرن للعرض
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else {
      return 'Just now';
    }
  }

  // المصنع لتحويل JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toIso8601String()),
      reviewerName: json['reviewerName'] ?? '',
      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }

  // التحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }

  // نسخ مع إمكانية التعديل
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

  @override
  String toString() {
    return 'Review(rating: $rating, reviewer: $reviewerName)';
  }
}

// نموذج البيانات الوصفية
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

  // هل تم تحديث المنتج مؤخراً؟
  bool get isRecentlyUpdated => DateTime.now().difference(updatedAt).inDays < 7;

  // المصنع لتحويل JSON
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
      barcode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }

  // التحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }

  // نسخ مع إمكانية التعديل
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

  @override
  String toString() {
    return 'Meta(created: $createdAt, updated: $updatedAt)';
  }
}

// دوال مساعدة للتعامل مع الاستجابة
class ProductsResponseHelper {
  // فلترة المنتجات حسب التصنيف
  static List<ProductModel> filterByCategory(
    ProductsResponseModel response,
    String category,
  ) {
    return response.products
        .where(
          (product) => product.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }

  // فلترة المنتجات حسب العلامة
  static List<ProductModel> filterByTag(
    ProductsResponseModel response,
    String tag,
  ) {
    return response.products
        .where(
          (product) =>
              product.tags.any((t) => t.toLowerCase() == tag.toLowerCase()),
        )
        .toList();
  }

  // فلترة المنتجات حسب السعر
  static List<ProductModel> filterByPriceRange(
    ProductsResponseModel response,
    double minPrice,
    double maxPrice,
  ) {
    return response.products
        .where(
          (product) => product.price >= minPrice && product.price <= maxPrice,
        )
        .toList();
  }

  // فلترة المنتجات حسب التقييم
  static List<ProductModel> filterByRating(
    ProductsResponseModel response,
    double minRating,
  ) {
    return response.products
        .where((product) => product.rating >= minRating)
        .toList();
  }

  // ترتيب المنتجات
  static List<ProductModel> sortProducts(
    List<ProductModel> products,
    SortType sortType, {
    bool ascending = true,
  }) {
    List<ProductModel> sorted = List.from(products);

    switch (sortType) {
      case SortType.price:
        sorted.sort(
          (a, b) => ascending
              ? a.price.compareTo(b.price)
              : b.price.compareTo(a.price),
        );
        break;
      case SortType.rating:
        sorted.sort(
          (a, b) => ascending
              ? a.rating.compareTo(b.rating)
              : b.rating.compareTo(a.rating),
        );
        break;
      case SortType.name:
        sorted.sort(
          (a, b) => ascending
              ? a.title.compareTo(b.title)
              : b.title.compareTo(a.title),
        );
        break;
      case SortType.discount:
        sorted.sort(
          (a, b) => ascending
              ? a.discountPercentage.compareTo(b.discountPercentage)
              : b.discountPercentage.compareTo(a.discountPercentage),
        );
        break;
    }

    return sorted;
  }

  // البحث في المنتجات
  static List<ProductModel> searchProducts(
    ProductsResponseModel response,
    String query,
  ) {
    if (query.isEmpty) return response.products;

    final lowerQuery = query.toLowerCase();
    return response.products.where((product) {
      return product.title.toLowerCase().contains(lowerQuery) ||
          product.description.toLowerCase().contains(lowerQuery) ||
          product.brand.toLowerCase().contains(lowerQuery) ||
          product.category.toLowerCase().contains(lowerQuery) ||
          product.tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
    }).toList();
  }
}

// أنواع الترتيب
enum SortType { price, rating, name, discount }

// نموذج طلب المنتجات مع البجينيشن
class ProductsRequest {
  final int limit;
  final int skip;
  final String? category;
  final String? search;
  final SortType? sortBy;
  final bool? ascending;

  ProductsRequest({
    this.limit = 10,
    this.skip = 0,
    this.category,
    this.search,
    this.sortBy,
    this.ascending = true,
  });

  // التحويل إلى معلمات query string
  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{'limit': limit, 'skip': skip};

    if (category != null && category!.isNotEmpty) {
      params['category'] = category;
    }

    if (search != null && search!.isNotEmpty) {
      params['search'] = search;
    }

    if (sortBy != null) {
      params['sortBy'] = sortBy!.name;
      params['ascending'] = ascending;
    }

    return params;
  }

  // طلب الصفحة التالية
  ProductsRequest nextPage() {
    return copyWith(skip: skip + limit);
  }

  // طلب الصفحة السابقة
  ProductsRequest previousPage() {
    final newSkip = skip - limit;
    return copyWith(skip: newSkip < 0 ? 0 : newSkip);
  }

  // نسخ مع إمكانية التعديل
  ProductsRequest copyWith({
    int? limit,
    int? skip,
    String? category,
    String? search,
    SortType? sortBy,
    bool? ascending,
  }) {
    return ProductsRequest(
      limit: limit ?? this.limit,
      skip: skip ?? this.skip,
      category: category ?? this.category,
      search: search ?? this.search,
      sortBy: sortBy ?? this.sortBy,
      ascending: ascending ?? this.ascending,
    );
  }

  @override
  String toString() {
    return 'ProductsRequest(limit: $limit, skip: $skip, page: ${(skip ~/ limit) + 1})';
  }
}
