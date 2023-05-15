import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_cubit.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_state.dart';
import 'package:order_app/feature/screens/home/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF36383D),
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
          return Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _SignInLogo(),
                    const SizedBoxH24(),
                    Text(
                      "Log In",
                      style: GoogleFonts.quicksand(color: Colors.white, fontSize: 32),
                    ),
                    const SizedBoxH24(),
                    const CustomTextField(
                      icon: Icons.person_2_outlined,
                      title: 'Enter your email adresss',
                    ),
                    const SizedBoxH16(),
                    const CustomTextField(
                      icon: Icons.key,
                      title: 'Enter your password',
                    ),
                    const SizedBoxH24(),
                    InkWell(
                      child: Container(
                        width: context.mediaQuery.size.width * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent])),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: GoogleFonts.quicksand(color: Colors.white, fontSize: 28),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SizedBoxH16 extends StatelessWidget {
  const SizedBoxH16({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class SizedBoxH24 extends StatelessWidget {
  const SizedBoxH24({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF3C3E42)),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
            border: InputBorder.none,
            hintText: title,
            hintStyle: GoogleFonts.quicksand(color: Colors.grey, fontSize: 20)),
      ),
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
