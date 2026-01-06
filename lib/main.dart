import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/screens/splash_screen.dart';
import 'Utils/Preference.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),


      home:  PartySplashScreen(),
    );
  }
}

