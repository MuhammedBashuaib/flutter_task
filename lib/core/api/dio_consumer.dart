import 'package:dio/dio.dart';
import 'package:flutter_tasck_app/core/api/api_consumer.dart';
import 'package:flutter_tasck_app/core/api/api_interceptors.dart';
import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/shared/data/services/storage_service.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  final StorageService storageService;

  DioConsumer({required this.dio, required this.storageService}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors(storageService: storageService));
    dio.interceptors.add(
      LogInterceptor(
        responseHeader: true,
        responseBody: true,
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final Response response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  //
}
