import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_flat_button.dart';

class EmptyProductsPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? buttonTitle;
  final bool showButton;
  final VoidCallback? onTap;
  const EmptyProductsPage({
    super.key,
    this.title,
    this.subtitle,
    this.buttonTitle,
    this.showButton = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.ah),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.ah,
            child: Lottie.asset(LottieAssets.emptyStaff),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.ah),
              child: Text(
                title ?? AppStrings.noProducts,
                style: AppTextStyles.h3.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.aw),
              child: Text(
                subtitle ?? AppStrings.noProductsSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.body1Regular.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                  height: 1.5,
                ),
              ),
            ),
          ),
          showButton ? Padding(
            padding: EdgeInsets.only(top: 20.ah, left: 104.aw, right: 104.aw),
            child: AppFlatButton(
              onPressed: () {
                if(onTap != null){
                  onTap!.call();
                  return;
                }
              },
              buttonTitle: buttonTitle ?? AppStrings.refresh,
              backgroundColor: null,
            ),
          ): const SizedBox.shrink(),
        ],
      ),
    );
  }
}
