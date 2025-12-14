import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/errors/error_model.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/auth/data/models/user_model.dart';
import 'package:flutter_tasck_app/features/auth/data/services/auth_services.dart';
import 'package:flutter_tasck_app/shared/data/services/storage_service.dart';
import 'package:flutter_tasck_app/shared/functions/check_internet.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthServices authRemoteDataSource;
  final StorageService storageService;

  LoginCubit({required this.authRemoteDataSource, required this.storageService})
    : super(LoginInitial());

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      if (await checkInternet()) {
        final UserModel user = await authRemoteDataSource.login(
          username: userName,
          password: password,
        );

        await storageService.saveUser(user);
        emit(LoginSuccess(user: user));

        log('✅ Login successful for user: $userName');
      } else {
        log('⚠️ No internet connection.');
        throw ServerException(
          errorModel: ErrorModel(message: 'No internet connection'),
        );
      }
    } on ServerException catch (e) {
      log('❌ Login failed: ${e.errorModel.message}');
      emit(LoginFailure(error: e.errorModel));
    } catch (e) {
      log('❌ Unexpected login error: $e');
      emit(
        LoginFailure(
          error: ErrorModel(message: 'An unexpected error occurred'),
        ),
      );
    }
  }

  void resetState() {
    emit(LoginInitial());
  }
}
