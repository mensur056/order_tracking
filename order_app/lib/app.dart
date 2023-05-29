import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app/core/bloc/auth/auth_cubit.dart';
import 'package:order_app/core/bloc/detail/detail_cubit.dart';
import 'package:order_app/core/bloc/home/home_cubit.dart';
import 'package:order_app/core/bloc/sign_in/sign_in_cubit.dart';
import 'package:order_app/core/data/contractors/i_detail_repository.dart';
import 'package:order_app/core/data/contractors/i_home_repository.dart';
import 'package:order_app/feature/screens/splash/splash_page.dart';

import 'core/data/contractors/i_auth_repository.dart';
import 'core/data/repository/impl_auth_repository.dart';
import 'core/data/repository/impl_detail_repository.dart';
import 'core/data/repository/impl_home_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IHomeRepository>(
      create: (context) => ImplHomeRepository(),
      child: RepositoryProvider<IAuthRepository>(
        create: (context) => ImplAuthRepository(),
        child: RepositoryProvider<IDetailRepository>(
          create: (context) => ImplDetailRepository(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<SignInCubit>(
                create: (context) => SignInCubit(context.read<IAuthRepository>()),
              ),
              BlocProvider<AuthCubit>(
                create: (context) => AuthCubit(context.read<IAuthRepository>())..checkAuth(),
              ),
              BlocProvider<HomeCubit>(
                create: (context) => HomeCubit(context.read<IHomeRepository>())..fetchProjects(),
              ),
              BlocProvider<DetailOrderCubit>(
                create: (context) =>
                    DetailOrderCubit(context.read<IDetailRepository>())..fetchOrders(),
              )
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Order Tracking',
              home: SplashPage(),
            ),
          ),
        ),
      ),
    );
  }
}
