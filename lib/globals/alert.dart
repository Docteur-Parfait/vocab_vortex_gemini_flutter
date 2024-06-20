import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../exports.dart';

class AlertHelper {
  static void customSoonDialog(BuildContext context, {Widget? content}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            "Bientôt disponible",
            style: globalTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: ColorStyles.kPrimary),
          ),
          content: Text(
            "Cette fonctionnalité est en cours de déploiement et sera bientôt disponible chez vous. Merci de votre patience.",
            style: globalTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorStyles.kPrimary),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: ColorStyles.kPrimary.withOpacity(0.2)),
              child: Text(
                "J'ai compris",
                style: globalTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorStyles.kPrimary),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void customChoixDialog(BuildContext context,
      {String? content,
      String? title,
      String? cancelText,
      String? acceptText,
      void Function()? cancelPress,
      void Function()? acceptPress,
      String type = "Alert"}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            title!,
            style: globalTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: ColorStyles.kPrimary),
          ),
          content: Text(
            content!,
            style: globalTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorStyles.kPrimary),
          ),
          actions: <Widget>[
            if (cancelText != null)
              TextButton(
                onPressed: cancelPress ?? () => Get.back(),
                child: Text(
                  cancelText,
                  style: globalTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: type == "Alert"
                          ? ColorStyles.kAccent
                          : ColorStyles.kRed),
                ),
              ),
            TextButton(
              onPressed: acceptPress,
              child: Text(
                acceptText!,
                style: globalTextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: type == "Alert"
                        ? ColorStyles.kRed
                        : ColorStyles.kAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  static void customAlertChoixDialog(BuildContext context,
      {String? content,
      String? title,
      String? bigInfo,
      String? cancelText,
      String? acceptText,
      void Function()? cancelPress,
      void Function()? acceptPress}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            title!,
            style: globalTextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: ColorStyles.kPrimary),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                content!,
                style: globalTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorStyles.kPrimary),
              ),
              const Gap(15),
              if (bigInfo != null)
                Text(
                  bigInfo,
                  style: globalTextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 35,
                      color: ColorStyles.kPrimary),
                ),
            ],
          ),
          actions: <Widget>[
            if (cancelText != null)
              TextButton(
                onPressed: cancelPress ?? () => Get.back(),
                child: Text(
                  cancelText,
                  style: globalTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorStyles.kRed),
                ),
              ),
            TextButton(
              onPressed: acceptPress,
              child: Text(
                acceptText!,
                style: globalTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorStyles.kAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  static void customDialogLoading(BuildContext context,
      {String status = "Chargement en cours", bool dismissOnTap = false}) {
    showDialog<void>(
      context: context,
      barrierDismissible: dismissOnTap,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GloabalLottieBuilder(src: LottieAssets.loading, width: 70),
              const Gap(20),
              Text(status,
                  style: globalTextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14))
            ],
          ),
        );
      },
    );
  }

  static void customErrorDialog(BuildContext context,
      {String? content,
      String buttonText = "ok",
      String title = "Erreur!",
      VoidCallback? onPressed}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            title,
            style: globalTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: ColorStyles.kRed),
          ),
          content: Text(
            content!,
            style: globalTextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorStyles.kPrimary),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: ColorStyles.kRed.withOpacity(0.2)),
              onPressed: onPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Text(
                buttonText,
                style: globalTextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: ColorStyles.kRed),
              ),
            ),
          ],
        );
      },
    );
  }
}
