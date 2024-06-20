import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocab_vortex/exports.dart';

class StatProfilWidget extends StatelessWidget {
  const StatProfilWidget({
    super.key,
    required this.icon,
    required this.value,
  });

  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(top: 2, bottom: 2, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
              ),
              const Gap(10),
              Text(
                value,
                style: globalTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorStyles.kWhite),
              )
            ],
          ),
        )
      ],
    );
  }
}
