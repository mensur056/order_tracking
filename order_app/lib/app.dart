import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_cubit.dart';

import 'core/data/contractors/i_auth_repository.dart';
import 'core/data/repository/impl_auth_repository.dart';
import 'feature/screens/sign_in/sign_in_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAuthRepository>(
      create: (context) => ImplAuthRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignInCubit>(
            create: (context) => SignInCubit(context.read<IAuthRepository>()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Order Tracking',
          home: SignInPage(),
        ),
      ),
    );
  }
}
