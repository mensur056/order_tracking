import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_app/core/locator/locator.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await GetStorage.init();
  runApp(const MyApp());
}
