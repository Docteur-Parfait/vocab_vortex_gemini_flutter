import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:vocab_vortex/exports.dart';

class HelpComponent extends StatefulWidget {
  const HelpComponent({super.key});

  @override
  State<HelpComponent> createState() => _HelpComponentState();
}

class _HelpComponentState extends State<HelpComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.9,
      width: Get.width * 0.45,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(IconAssets.help), fit: BoxFit.fill)),
      child: Column(
        children: [
          Text(
            "Helps",
            style: globalTextStyle(fontSize: 25, color: ColorStyles.kPrimary),
          ),
          const Gap(10),
          Text(
            AppString.gameDescription,
            style: globalTextStyle(color: ColorStyles.kRed, fontSize: 18),
          ),
          const Gap(10),
          helpListMethod(icon: IconAssets.match, label: "Total Match"),
          const Gap(10),
          helpListMethod(icon: IconAssets.win, label: "Total Win"),
          const Gap(10),
          helpListMethod(icon: IconAssets.lost, label: "Total Lost"),
          const Gap(10),
          const Text(
            "By Tech Pastor",
            style: TextStyle(
                color: ColorStyles.kPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget helpListMethod({required String icon, required String label}) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 30,
        ),
        const Gap(10),
        Text(
          "=",
          style: globalTextStyle(fontSize: 18, color: ColorStyles.kBlack),
        ),
        const Gap(10),
        Text(
          label,
          style: globalTextStyle(fontSize: 18, color: ColorStyles.kBlack),
        ),
      ],
    );
  }
}
