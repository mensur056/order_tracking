import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/data/contractors/i_auth_repository.dart';

import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this._authRepository,
  ) : super(SignInInitial());

  final IAuthRepository _authRepository;
  String defaultLanguageCode = 'tr';
  bool isObscure = true;
  Future<void> signInUser(String email, String password) async {
    emit(SignInInProgress());
    final result = await _authRepository.signIn(email, password);
    if (result.isSuccess()) {
      emit(SignInSuccess());
    } else if (result.isError()) {
      emit(SignInFailure());
    }
  }

  void changeVisibleIcon() {
    isObscure = !isObscure;
    emit(SignInIcon(isObscure: isObscure));
  }

  void selectLanguage(String languageCode) {
    defaultLanguageCode = languageCode;
    emit(SignInLocalization(defaultLanguageCode));
  }
}
