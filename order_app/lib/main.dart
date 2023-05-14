import 'package:flutter/material.dart';
import 'package:order_app/core/locator/locator.dart';

import 'feature/screens/sign_in/sign_in_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const MyApp());
}

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
