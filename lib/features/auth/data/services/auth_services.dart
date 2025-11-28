import 'package:flutter_tasck_app/core/api/api_consumer.dart';
import 'package:flutter_tasck_app/core/api/end_points.dart';
import 'package:flutter_tasck_app/core/errors/error_model.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/auth/data/models/user_model.dart';

abstract class AuthServices {
  Future<UserModel> login({required String username, required String password});
}

class AuthServicesImpl implements AuthServices {
  final ApiConsumer apiConsumer;

  AuthServicesImpl({required this.apiConsumer});

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.authLogin,
        data: {UserKeys.username: username, UserKeys.passwrod: password},
      );

      if (response is! Map<String, dynamic>) {
        throw ServerException(
          errorModel: ErrorModel(message: 'Invalid response format'),
        );
      }

      return UserModel.fromJson(response);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorModel: ErrorModel(message: 'Login failed: $e'),
      );
    }
  }
}
