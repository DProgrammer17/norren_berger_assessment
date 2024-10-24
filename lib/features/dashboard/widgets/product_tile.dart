import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';
import 'package:norrenberger_assesment/network/net_utils/enums/currency.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_number.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_date_time.dart';

class ProductTile extends StatelessWidget {
  final Result response;
  final VoidCallback onTap;
  const ProductTile({
    super.key,
    required this.response,
    required this.onTap,
  });

  String? fundFormat() => (response.currency != null &&
          (response.currency!.jsonString == Currency.naira.jsonString))
      ? response.minFund?.formatCurrencyNairaNum()
      : response.minFund?.formatCurrencyDollarNum();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            response.productName ?? AppStrings.unavailable,
            style: AppTextStyles.body2Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          Text(
            '${AppStrings.minFund} ${fundFormat() ?? AppStrings.unavailable}',
            style:
                AppTextStyles.body1Regular.copyWith(color: AppColors.textBlack),
          ),
          SizedBox(height: 10.ah),
          Text(
            response.description ?? '-',
            style: AppTextStyles.body1Regular,
          ),
          SizedBox(height: 7.ah),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                response.createdAt?.dateTimeReadable() ?? '-',
                style: AppTextStyles.body3Regular,
              ),
              if(response.subProduct != null && response.subProduct!.isNotEmpty)...[
                Text(
                  AppStrings.clickHere,
                  style: AppTextStyles.body3Regular.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 10.ah),
        ],
      ),
    );
  }
}
