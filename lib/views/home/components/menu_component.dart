import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/exports.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({super.key});

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: Get.height - 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            ImageAssets.logo,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuTileWidget(
                title: "Start",
                onTap: () => Get.to(const GameScreen()),
              ),
              MenuTileWidget(
                title: "Settings",
                onTap: () => Get.to(const SettingScreen()),
              ),
              MenuTileWidget(
                title: "Quit",
                onTap: () {
                  AlertHelper.customChoixDialog(context,
                      content: "Do you want to leave?",
                      acceptText: "yes",
                      cancelText: "No",
                      cancelPress: () => Get.back(),
                      acceptPress: () {
                        Get.back();

                        SystemNavigator.pop();
                      },
                      title: "Quit");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
