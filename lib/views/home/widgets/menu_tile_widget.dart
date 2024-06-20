import 'package:flutter/material.dart';
import 'package:vocab_vortex/exports.dart';

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            IconAssets.menuTile,
            height: 50,
          ),
          Text(
            title,
            style: globalTextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: ColorStyles.kPrimary),
          )
        ],
      ),
    );
  }
}
