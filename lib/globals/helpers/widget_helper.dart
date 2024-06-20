import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vocab_vortex/exports.dart';

class WidgetHelper {
  static Widget customCircularLoading({String? status}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GloabalLottieBuilder(src: LottieAssets.loading, width: 90),
          const Gap(10),
          Text(
            status ?? "Loading...",
            style: globalTextStyle(color: ColorStyles.kWhite, fontSize: 25),
          )
        ],
      ),
    );
  }

  static InputDecoration customDecorationMethod(
      {String label = "",
      bool labelIsText = true,
      Widget? widgetLabel,
      Widget? prefixIcon,
      Widget? suffixIcon,
      double radius = 30,
      Color border = ColorStyles.kGrey85,
      BoxConstraints? prefixIconConstraints}) {
    return InputDecoration(
        prefixIconConstraints: prefixIconConstraints,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        hintText: label,
        hintStyle: globalTextStyle(color: ColorStyles.kGrey.withOpacity(0.5)),
        filled: false,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 4, color: border)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
                width: 4, color: ColorStyles.kSecondary.withOpacity(1))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
                width: 4, color: ColorStyles.kSecondary.withOpacity(1))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                BorderSide(width: 4, color: ColorStyles.kRed.withOpacity(1))));
  }

  static Widget errorElementComponent(
      {void Function()? onPressed,
      String status = "Loading error!",
      double size = 100}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconAssets.networkError, width: size),
          const Gap(15),
          Text(
            status,
            style: globalTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorStyles.kRed),
          ),
          const Gap(10),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "Try again",
              style: globalTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: ColorStyles.kWhite),
            ),
          )
        ],
      ),
    );
  }
}
