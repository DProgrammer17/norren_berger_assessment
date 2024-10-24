import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';

class ProductDetailsText extends StatelessWidget {
  final String title;
  final String detail;

  const ProductDetailsText({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              AppTextStyles.body2Regular.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6.ah),
        Text(
          detail,
          style:
          AppTextStyles.body1Regular,
        ),
      ],
    );
  }
}
