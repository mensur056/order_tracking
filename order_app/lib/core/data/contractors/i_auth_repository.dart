import 'package:multiple_result/multiple_result.dart';
import 'package:order_app/core/data/model/responses/sign_in_response.dart';
import 'package:order_app/core/data/model/responses/sign_up_response.dart';

import '../../../feature/global/auth_failure.dart';

abstract class IAuthRepository {
  Future<Result<SignInResponse, AuthFailure>> signIn(String email, String password);
  Future<Result<SignUpResponse, AuthFailure>> signUp(String email, String password);
}
