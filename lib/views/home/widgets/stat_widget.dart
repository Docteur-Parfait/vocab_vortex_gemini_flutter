import 'package:flutter/material.dart';
import 'package:vocab_vortex/exports.dart';

class StatWidget extends StatelessWidget {
  const StatWidget({
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
        Stack(
          children: [
            Image.asset(
              IconAssets.tile,
              width: 130,
            ),
            Container(
              height: 50,
              width: 130,
              padding: const EdgeInsets.only(top: 2, bottom: 2, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    icon,
                  ),
                  Text(
                    value,
                    style: globalTextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: ColorStyles.kWhite),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
