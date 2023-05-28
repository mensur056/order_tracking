import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/model/responses/auth/sign_in_response.dart';
import 'package:order_app/core/data/model/responses/auth/sign_up_response.dart';

import '../../../feature/global/failure/auth_failure.dart';

abstract class IAuthRepository {
  Future<Result<SignInResponse, AuthFailure>> signIn(String email, String password);
  Future<Result<SignUpResponse, AuthFailure>> signUp(String email, String password);
  Future<Result<bool, AuthFailure>> checkAuth();
}
