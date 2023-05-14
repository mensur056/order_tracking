import 'package:dio/dio.dart';
import 'package:order_app/core/data/model/requests/user_model.dart';
import 'package:order_app/core/data/model/responses/sign_in_response.dart';
import 'package:order_app/core/data/model/responses/sign_up_response.dart';
import 'package:order_app/keys.dart';

class AuthDataSource {
  final Dio _dio = Dio();
  Future<SignInResponse?> signIn(String email, String password) async {
    final signInUserJson = UserModel(email: email, password: password).toJson();
    final response = await _dio.post(signInUrl, data: signInUserJson);

    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = SignInResponse.fromJson(response.data);
        return signInResponse;
      }
    }
    return null;
  }

  Future<SignUpResponse?> signUp(String email, String password) async {
    final signInUserJson = UserModel(email: email, password: password).toJson();
    final response = await _dio.post(signUpUrl, data: signInUserJson);

    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = SignUpResponse.fromJson(response.data);
        return signInResponse;
      }
    }
    return null;
  }
}
