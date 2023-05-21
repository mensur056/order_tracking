import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/data_source/auth_data_source.dart';
import 'package:order_app/core/data/model/responses/sign_in_response.dart';
import 'package:order_app/core/data/model/responses/sign_up_response.dart';
import 'package:order_app/core/locator/locator.dart';

import 'package:order_app/feature/global/auth_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contractors/i_auth_repository.dart';

class ImplAuthRepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();
  @override
  Future<Result<SignInResponse, AuthFailure>> signIn(String email, String password) async {
    try {
      final result = await _authDataSource.signIn(email, password);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool("logged", true);
      return Success(result!);
    } catch (e) {
      return Error(AuthFailure());
    }
  }

  @override
  Future<Result<SignUpResponse, AuthFailure>> signUp(String email, String password) async {
    try {
      final result = await _authDataSource.signUp(email, password);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool("logged", true);
      return Success(result!);
    } catch (e) {
      return Error(AuthFailure());
    }
  }

  @override
  Future<Result<bool, AuthFailure>> checkAuth() async {
    try {
      final isAuth = await _authDataSource.isAuthenticated();
      return Success(isAuth!);
    } catch (e) {
      return Error(AuthFailure());
    }
  }
}
