import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_tasck_app/shared/data/services/storage_service.dart';

class ApiInterceptors extends Interceptor {
  final StorageService storageService;

  ApiInterceptors({required this.storageService});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // إضافة التوكن للتوكين المطلوبة
    if (_requiresAuth(options.path)) {
      final token = await storageService.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    // إعداد الهيدرات الأساسية
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': 'en', // يمكن تغييرها حسب لغة التطبيق
    });

    // log('🚀 [REQUEST] ${options.method} ${options.uri}');
    // log('📦 Headers: ${options.headers}');
    // if (options.data != null) {
    //   log('📤 Body: ${options.data}');
    // }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // log('✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}');
    // log('📥 Data: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // log(
    //   '❌ [ERROR] ${err.type} ${err.response?.statusCode} ${err.requestOptions.uri}',
    // );
    // log('📥 Error Data: ${err.response?.data}');

    super.onError(err, handler);
  }

  bool _requiresAuth(String path) {
    final publicEndpoints = ['auth/login'];

    return !publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
