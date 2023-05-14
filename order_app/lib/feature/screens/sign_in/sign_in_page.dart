import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_cubit.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_state.dart';
import 'package:order_app/feature/screens/home/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202124),
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("There is a error")));
          } else if (state is SignInSuccess) {
            context.navigateToPage(const HomePage());
          }
        },
        listenWhen: (_, current) => current is SignInFailure || current is SignInSuccess,
        buildWhen: (_, current) => current is! SignInSuccess,
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
