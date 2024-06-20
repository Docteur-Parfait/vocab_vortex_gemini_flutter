import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/app/providers/common_providers.dart';
import 'package:vocab_vortex/globals/config.dart';
import 'package:vocab_vortex/views/home/home_screen.dart';
import 'package:vocab_vortex/views/onboarding/name_screen.dart';
import 'package:vocab_vortex/views/onboarding/onboarding_screen.dart';

final splashControllerProvider = Provider((ref) => SplashController(ref: ref));

class SplashController {
  final Ref _ref;

  SplashController({required Ref ref}) : _ref = ref;

  void verifyMiddleware(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (AppConfig.devMode == false) {
        Get.to(const OnboardingScreen());
      } else {
        final user = _ref.read(currentUserProvider);

        if (user == null) {
          Get.off(const NameScreen());
        } else {
          Get.off(const HomeScreen());
        }
      }
    });
  }
}
