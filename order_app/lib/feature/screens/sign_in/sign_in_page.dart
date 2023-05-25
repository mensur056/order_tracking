import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_cubit.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_state.dart';
import 'package:order_app/feature/dialogs/custom_snack_bar.dart';
import 'package:order_app/feature/screens/home/home_page.dart';
import '../../../utility/constants/color.dart';
import '../../../utility/constants/sized_boxs.dart';
import '../../global/custom_button.dart';
import '../../global/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: _body(),
    );
  }

  BlocConsumer<SignInCubit, SignInState> _body() {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state is SignInFailure) {
          AppSnackBar().customSnackBar(context, 'Error', Colors.red);
        } else if (state is SignInSuccess) {
          AppSnackBar().customSnackBar(context, 'Success', Colors.green);
          await Future.delayed(
            const Duration(seconds: 2),
            () {
              context.navigateToPage(const HomePage());
            },
          );
        }
      },
      buildWhen: (_, current) => current is! SignInSuccess,
      listenWhen: (_, current) => current is SignInFailure || current is SignInSuccess,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const _SignInLogo(),
                      const SizedBoxH28(),
                      Text(
                        "Log In",
                        style: GoogleFonts.quicksand(color: Colors.white, fontSize: 32),
                      ),
                      const SizedBoxH28(),
                      CustomTextField(
                        inputAction: TextInputAction.next,
                        controller: emailController,
                        icon: Icons.person_2_outlined,
                        title: 'Enter your email adresss',
                      ),
                      const SizedBoxH20(),
                      CustomTextField(
                        inputAction: TextInputAction.done,
                        obscure: context.watch<SignInCubit>().isObscure,
                        suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              context.read<SignInCubit>().changeVisibleIcon();
                            },
                            child: Icon(
                              context.watch<SignInCubit>().isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            )),
                        controller: passwordController,
                        icon: Icons.key,
                        title: 'Enter your password',
                      ),
                      const SizedBoxH28(),
                      CustomButton(
                        title: 'Log In',
                        onTap: () async {
                          context
                              .read<SignInCubit>()
                              .signInUser(emailController.text, passwordController.text);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SignInLogo extends StatelessWidget {
  const _SignInLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          border: Border.all(color: const Color(0xFF2A2C2F), width: 15),
        ),
        child: const Icon(
          Icons.login,
          size: 34,
        ),
      ),
    );
  }
}
