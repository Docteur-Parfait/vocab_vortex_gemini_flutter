import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/exports.dart';
import 'package:vocab_vortex/views/home/components/menu_component.dart';
import 'package:vocab_vortex/views/home/components/stat_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.homeBg), fit: BoxFit.cover)),
        child: const Column(
          children: [StatComponent(), MenuComponent()],
        ),
      ),
    );
  }
}
