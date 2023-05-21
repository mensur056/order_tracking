import 'package:bloc/bloc.dart';
import 'package:order_app/core/data/contractors/i_auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState.initial);
  final IAuthRepository _authRepository;

  Future<void> checkAuth() async {
    final result = await _authRepository.checkAuth();
    await Future.delayed(const Duration(seconds: 4));
    if (result.isSuccess()) {
      final isAuth = result.tryGetSuccess();
      emit(isAuth! ? AuthState.authenticated : AuthState.authenticated);
    } else if (result.isError()) {
      emit(AuthState.unauthenticated);
    }
  }
}
