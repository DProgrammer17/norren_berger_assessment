import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';

class AppTextFieldRichText extends StatelessWidget {
  final String title1;
  final String? title2;
  final Color? color1;
  final Color? color2;

  const AppTextFieldRichText({
    super.key,
    required this.title1,
    this.title2,
    this.color1,
    this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: AppTextStyles.body2Regular.copyWith(
                color: color1 ?? AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.asp),
          ),
          TextSpan(
            text: ' ${title2 ?? '*'}',
            style: AppTextStyles.body2Regular.copyWith(
              color: color2 ?? AppColors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
