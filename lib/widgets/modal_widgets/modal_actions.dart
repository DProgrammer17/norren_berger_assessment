import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/core/navigation.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_flat_button.dart';

void showModalActionError({
  required BuildContext context,
  required String errorText,
  String? title,
  String? lottieAnimation,
  double? height,
  double? width,
  VoidCallback? onTap,
  bool isDismissible = false,
}) {
  return showModalAction(
    context: context,
    dialogTitle: title ?? 'An error occurred.',
    dialogSubtitle: errorText,
    isDismissible: isDismissible,
    onPressed: () => onTap != null ? onTap.call() : context.popSuper(),
    lottieAnimation: LottieBuilder.asset(
      lottieAnimation ?? LottieAssets.warningStatus,
      height: height ?? 110.ah,
      width: width ?? 110.aw,
    ),
  );
}

void showModalActionSuccess({
  required BuildContext context,
  required String subtitle,
  String? title,
  required void Function()? onPressed,
  bool isDismissible = false,
  bool enableDrag = true,
}) {
  return showModalAction(
    context: context,
    dialogTitle: title ?? 'Success',
    dialogSubtitle: subtitle,
    onPressed: onPressed,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
  );
}

void showModalActionCustom({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String assetPath,
  required void Function()? onPressed,
  bool isDismissible = false,
}) {
  return showModalAction(
    context: context,
    dialogTitle: title,
    dialogSubtitle: subtitle,
    onPressed: onPressed,
    isDismissible: isDismissible,
    lottieAnimation: LottieBuilder.asset(assetPath),
  );
}

void showModalAction({
  required BuildContext context,
  required String dialogTitle,
  required String dialogSubtitle,
  void Function()? onPressed,
  VoidCallback? doubleButton1Tap,
  VoidCallback? doubleButton2Tap,
  String? buttonTitle,
  String? doubleButtonTitle1,
  String? doubleButtonTitle2,
  Widget? lottieAnimation,
  bool isDismissible = false,
  bool enableDrag = true,
  bool useDoubleButton = false,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.neutralWhite,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.aw,
            right: 12.aw,
            top: 12.ah,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150.ah,
                child: lottieAnimation ??
                    LottieBuilder.asset(LottieAssets.successTick),
              ),
              SizedBox(height: 8.ah),
              Text(
                dialogTitle,
                style: TextStyle(
                  fontSize: 18.asp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.ah),
              Text(
                dialogSubtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.ah),
              AppFlatButton(
                onPressed: onPressed,
                buttonTitle: buttonTitle ?? AppStrings.ok,
                backgroundColor: null,
              ),
              SizedBox(height: 24.ah),
            ],
          ),
        ),
      );
    },
  );
}