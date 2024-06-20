import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vocab_vortex/exports.dart';

class BingoWidget extends StatelessWidget {
  const BingoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Lottie.asset(LottieAssets.bingo, height: Get.height)),
        Expanded(child: Lottie.asset(LottieAssets.bingo, height: Get.height)),
        Expanded(child: Lottie.asset(LottieAssets.bingo, height: Get.height))
      ],
    );
  }
}
