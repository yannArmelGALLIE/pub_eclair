import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pub_eclair/features/authentication/screens/signin_advertiser_page.dart';
import 'package:pub_eclair/features/authentication/screens/signin_page.dart';
import 'package:pub_eclair/features/authentication/screens/signup_page.dart';
import 'package:pub_eclair/navigation_menu.dart';
import 'package:pub_eclair/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        '/login': (context) => SigninPage(),
        '/home': (context) => NavigationMenu(),
        '/register': (context) => SignupPage(),
        '/loginAdvertiser': (context) => SigninAdvertiserPage(),
      },
      );
  }
}
