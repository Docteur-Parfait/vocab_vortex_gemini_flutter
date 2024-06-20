import 'package:flutter/material.dart';
import 'package:vocab_vortex/exports.dart';

class LetterContainer extends StatelessWidget {
  final String? letter;

  const LetterContainer({super.key, this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: letter != null ? ColorStyles.kPrimary : Colors.transparent,
        border: Border.all(color: ColorStyles.kWhite, width: 4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          letter ?? '',
          style: globalTextStyle(fontSize: 25.0, color: ColorStyles.kSecondary),
        ),
      ),
    );
  }
}
