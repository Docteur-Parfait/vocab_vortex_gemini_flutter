import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/app/controllers/splash_controller.dart';
import 'package:vocab_vortex/globals/assets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    ref.read(splashControllerProvider).verifyMiddleware(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.splashBg), fit: BoxFit.cover)),
        child: Center(
          child: Image.asset(
            ImageAssets.logo,
            height: Get.height * 0.8,
          ),
        ),
      ),
    );
  }
}
