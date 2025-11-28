import 'package:flutter_tasck_app/core/api/api_consumer.dart';
import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/core/errors/error_model.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';

abstract class ProductServices {
  Future<ProductsResponse> getProducts({int limit = 10, int skip = 0});
}

class ProductServicesImpl implements ProductServices {
  final ApiConsumer apiConsumer;

  ProductServicesImpl({required this.apiConsumer});

  @override
  Future<ProductsResponse> getProducts({int limit = 10, int skip = 0}) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.products.split('?').first,
        queryParameters: {'limit': limit, 'skip': skip},
      );

      if (response is! Map<String, dynamic>) {
        throw ServerException(
          errorModel: ErrorModel(
            message: 'Invalid response format for products',
          ),
        );
      }

      return ProductsResponse.fromJson(response);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorModel: ErrorModel(message: 'Failed to fetch products: $e'),
      );
    }
  }
}
