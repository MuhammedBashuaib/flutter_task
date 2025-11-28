import 'package:flutter_tasck_app/core/api/end_points.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String accessToken;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserKeys.id] as int? ?? 0,
      username: json[UserKeys.username] as String? ?? '',
      email: json[UserKeys.email] as String? ?? '',
      firstName: json[UserKeys.firstName] as String? ?? '',
      lastName: json[UserKeys.lastName] as String? ?? '',
      gender: json[UserKeys.gender] as String? ?? '',
      image: json[UserKeys.image] as String? ?? '',
      accessToken: json[UserKeys.accessToken] as String? ?? '',
      refreshToken: json[UserKeys.refreshTokenken] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserKeys.id: id,
      UserKeys.username: username,
      UserKeys.email: email,
      UserKeys.firstName: firstName,
      UserKeys.lastName: lastName,
      UserKeys.gender: gender,
      UserKeys.image: image,
      UserKeys.accessToken: accessToken,
      UserKeys.refreshTokenken: refreshToken,
    };
  }
}
