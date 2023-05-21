import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/bloc/auth/auth_state.dart';
import 'package:order_app/feature/screens/home/home_page.dart';
import 'package:order_app/feature/screens/sign_in/sign_in_page.dart';

import '../../../core/bloc/auth/auth_cubit.dart';
import '../../../core/bloc/sign_up/sign_up_cubit.dart';
import '../../../core/data/contractors/i_auth_repository.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state == AuthState.initial) {
            return const Center(
              child: Text("Checking.."),
            );
          } else if (state == AuthState.unauthenticated) {
            return BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(context.read<IAuthRepository>()),
              child: SignInPage(),
            );
          } else {
            return const HomePage();
            // return const WelcomePage();
            // return BlocProvider<OnboardingCubit>(
            //   create: (context) => OnboardingCubit(),
            //   child: const OnboardingPage(),
            // );
            // return BlocProvider<SignInCubit>(
            //   create: (context) => SignInCubit(context.read<IAuthRepository>()),
            //   child: SignInPage(),
            // );
          }
        },
      ),
    );
  }
}
