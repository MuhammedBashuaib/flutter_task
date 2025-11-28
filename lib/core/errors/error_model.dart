import 'package:dio/dio.dart';
import 'package:flutter_tasck_app/core/api/end_points.dart';

class ErrorModel {
  final int? statusCode;
  final String message;
  final String? errorCode;
  final Map<String, dynamic>? errors;

  ErrorModel({
    this.statusCode,
    required this.message,
    this.errorCode,
    this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json[ApiKeys.statusCode] as int?,
      message:
          json[ApiKeys.message] as String? ??
          json['error'] as String? ??
          'An unexpected error occurred',
      errorCode: json['errorCode'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }

  factory ErrorModel.fromDioException(DioException e) {
    final responseData = e.response?.data;

    if (responseData is Map<String, dynamic>) {
      return ErrorModel.fromJson(responseData);
    } else if (responseData is String) {
      return ErrorModel(
        statusCode: e.response?.statusCode,
        message: responseData,
      );
    } else {
      return ErrorModel(
        statusCode: e.response?.statusCode,
        message: _getDioExceptionMessage(e),
      );
    }
  }

  static String _getDioExceptionMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout occurred';
      case DioExceptionType.sendTimeout:
        return 'Send timeout occurred';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout occurred';
      case DioExceptionType.connectionError:
        return 'Connection error occurred';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        return 'No internet connection';
      case DioExceptionType.badCertificate:
        return 'Bad certificate';
      case DioExceptionType.badResponse:
        return 'Server responded with an error';
    }
  }

  // 🔥 دالة copyWith المضافة
  ErrorModel copyWith({
    int? statusCode,
    String? message,
    String? errorCode,
    Map<String, dynamic>? errors,
  }) {
    return ErrorModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      errorCode: errorCode ?? this.errorCode,
      errors: errors ?? this.errors,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.statusCode: statusCode,
      ApiKeys.message: message,
      'errorCode': errorCode,
      'errors': errors,
    };
  }

  @override
  String toString() {
    return 'ErrorModel(statusCode: $statusCode, message: $message, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.statusCode == statusCode &&
        other.message == message &&
        other.errorCode == errorCode &&
        other.errors == errors;
  }

  @override
  int get hashCode {
    return statusCode.hashCode ^
        message.hashCode ^
        errorCode.hashCode ^
        errors.hashCode;
  }
}
