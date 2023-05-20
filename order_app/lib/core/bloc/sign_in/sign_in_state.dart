abstract class SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {}

class SignInInProgress extends SignInState {}

class SignInInitial extends SignInState {}

class SignInIcon extends SignInState {
  bool isObscure;

  SignInIcon({required this.isObscure});
}
