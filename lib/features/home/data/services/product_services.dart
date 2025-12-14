import 'dart:developer';

import 'package:flutter_tasck_app/core/api/api_consumer.dart';
import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'package:flutter_tasck_app/core/errors/error_model.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_reposetry.dart';

abstract class ProductServices {
  Future<ProductsResponse> fetchProducts({
    required int limit,
    required int skip,
  });
}

class ProductServicesImpl implements ProductServices {
  final ApiConsumer apiConsumer;

  ProductServicesImpl({required this.apiConsumer});

  @override
  Future<ProductsResponse> fetchProducts({
    required int limit,
    required int skip,
  }) async {
    try {
      final path = EndPoints.products.split('?').first;
      log('Fetching products -> path: $path, limit: $limit, skip: $skip');
      final response = await apiConsumer.get(
        path,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      if (response is Map<String, dynamic>) {
        return ProductsResponse.fromJson(response);
      }

      throw ServerException(
        errorModel: ErrorModel(message: 'Invalid response format for products'),
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorModel: ErrorModel(message: 'Failed to fetch products: $e'),
      );
    }
  }
}
