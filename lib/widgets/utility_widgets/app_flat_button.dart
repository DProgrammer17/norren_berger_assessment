import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';

class AppFlatButton extends StatelessWidget {
  const AppFlatButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.textColor,
    this.width,
    this.height,
    this.verticalPadding,
    this.isDisabled = false,
  });

  final void Function()? onPressed;
  final String buttonTitle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? foregroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? verticalPadding;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 16.ah,
      ),
      child: Opacity(
        opacity: isDisabled ? 0.4 : 1.0,
        child: AbsorbPointer(
          absorbing: isDisabled,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.primaryColor,
              foregroundColor: foregroundColor,
              minimumSize: Size(
                (width ?? 0.9 * screenWidth),
                (height ?? 0.15 * screenWidth),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(14.0),
                ),
                side: BorderSide(color: borderColor ?? AppColors.primaryColor),
              ),
            ),
            child: Text(
              buttonTitle,
              style: AppTextStyles.body1Regular
                  .copyWith(color: textColor ?? AppColors.neutralWhite),
            ),
          ),
        ),
      ),
    );
  }
}
