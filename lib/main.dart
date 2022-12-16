// ignore_for_file: depend_on_referenced_packages

import 'package:buga_driver/component/colors.dart';
import 'package:buga_driver/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication.dart/signin/signin.dart';
import 'onboarding/onboardingscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Call the sharedPreferences when the app initialized to determine the bool condition of page to show.
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Authentication()),
  ], child: MyApp(showHome: showHome)));
}

class MyApp extends StatelessWidget {
  final bool? showHome;
  const MyApp({Key? key, this.showHome}) : super(key: key);

  // root of the Application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUGA DRIVER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.white,
        ),
        fontFamily: 'SF Pro Display',
      ),
      home: showHome! ? const SignIn() : const OnboardingPage(),
    );
  }
}
