import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/pages/home_page.dart';
import 'package:introduction_screen/pages/onboarding_page.dart';
import 'package:introduction_screen/pages/prectice_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
final pref=await SharedPreferences.getInstance();
final home=pref.getBool('home')??false;
  runApp( MyApp(showHome: home,));
}

class MyApp extends StatelessWidget {
  bool showHome;
 MyApp({super.key,required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.transparent,
        scaffoldBackgroundColor: const Color(0xFFba68c8),
      ),
      home: showHome?const Homepage(): const OnBoardingPage(),
    );
  }
}
