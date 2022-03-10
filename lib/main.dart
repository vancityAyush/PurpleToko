import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:purple_toko/constants.dart';
import 'package:purple_toko/screens/login_page.dart';
import 'package:purple_toko/services/networking.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<NetworkHelper>(NetworkHelper(baseUrl));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purple Torko',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
