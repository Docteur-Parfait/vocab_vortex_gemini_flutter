import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/views/app/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Vocab Vortex',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
