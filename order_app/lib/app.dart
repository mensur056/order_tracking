import 'package:flutter/material.dart';

import 'feature/screens/sign_in/sign_in_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order Tracking',
      home: SignInPage(),
    );
  }
}
