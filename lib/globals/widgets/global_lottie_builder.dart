import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

///[GloabalLottieBuilder] builds required image from an image URL [src] or a [file]
/// You can also use SVGs as it automatically takes care of what widget to use depending on file or url.

class GloabalLottieBuilder extends StatelessWidget {
  const GloabalLottieBuilder(
      {super.key, this.src, this.fit, this.width, this.height, this.file});

  final String? src;
  final File? file;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (file != null) {
      return Lottie.file(
        file!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => defaultImage(),
      );
    }

    if (src != null) {
      return Lottie.asset(
        src!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => defaultImage(),
      );
    }

    return defaultImage();
  }

  Widget defaultImage() {
    return const CircularProgressIndicator();
  }
}
