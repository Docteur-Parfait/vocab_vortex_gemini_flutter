import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/exports.dart';
import 'package:vocab_vortex/views/game/components/play_component.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ColorStyles.kPrimary,
        title: Text(
          "Vocab vortex",
          style: globalTextStyle(color: ColorStyles.kWhite),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AlertHelper.customChoixDialog(context,
                  content: "Do you want to leave 🤔, you will lost the game?",
                  acceptText: "yes",
                  cancelText: "No",
                  cancelPress: () => Get.back(),
                  acceptPress: () {
                    Get.back();

                    Get.back();
                  },
                  title: "Quit");
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              child: Image.asset(
                IconAssets.close,
                width: 45,
              ),
            ),
          )
        ],
      ),
      body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.homeBg), fit: BoxFit.cover)),
          child: const PlayComponent()),
    );
  }
}
