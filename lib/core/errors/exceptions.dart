import 'package:dio/dio.dart';
import 'error_model.dart';

abstract class AppException implements Exception {
  final ErrorModel errorModel;

  AppException({required this.errorModel});
}

class ServerException extends AppException {
  ServerException({required super.errorModel});
}

class CacheException extends AppException {
  CacheException({required super.errorModel});
}

class NetworkException extends AppException {
  NetworkException({required super.errorModel});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.errorModel});
}

class ValidationException extends AppException {
  ValidationException({required super.errorModel});
}

// دالة معالجة استثناءات Dio محسنة
void handleDioExceptions(DioException e) {
  final errorModel = ErrorModel.fromDioException(e);

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      throw NetworkException(errorModel: errorModel);

    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
      throw NetworkException(errorModel: errorModel);

    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: errorModel);

    case DioExceptionType.badResponse:
      _handleBadResponse(e, errorModel);
  }
}

void _handleBadResponse(DioException e, ErrorModel errorModel) {
  final statusCode = e.response?.statusCode;

  switch (statusCode) {
    case 400:
      throw ValidationException(errorModel: errorModel);
    case 401:
    case 403:
      throw UnauthorizedException(errorModel: errorModel);
    case 404:
      throw ServerException(
        errorModel: errorModel.copyWith(
          message: 'Requested resource not found',
        ),
      );
    case 500:
    case 502:
    case 503:
      throw ServerException(
        errorModel: errorModel.copyWith(
          message: 'Server is temporarily unavailable',
        ),
      );
    default:
      throw ServerException(errorModel: errorModel);
  }
}
