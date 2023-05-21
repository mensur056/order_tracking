import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_app/core/data/model/requests/user_model.dart';
import 'package:order_app/core/data/model/responses/sign_in_response.dart';
import 'package:order_app/core/data/model/responses/sign_up_response.dart';
import 'package:order_app/keys.dart';

class AuthDataSource {
  final Dio _dio = Dio()
    ..options = BaseOptions(
      contentType: "application/json",
    );
  Future<SignInResponse?> signIn(String email, String password) async {
    final signInUserJson = UserModel(email: email, password: password).toJson();
    final response = await _dio.post(signInUrl, data: signInUserJson);
    if (response.statusCode != null) {
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final signInResponse = SignInResponse.fromJson(response.data);
        return signInResponse;
      }
    } else {}
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

  Future<bool?> isAuthenticated() async {
    final getStorage = GetStorage();
    bool result = await getStorage.read('logged');
    return result;
  }
}
