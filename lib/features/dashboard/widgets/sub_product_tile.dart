import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';
import 'package:norrenberger_assesment/network/net_utils/enums/currency.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_number.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_date_time.dart';

class SubProductTile extends StatelessWidget {
  final SubProduct response;
  const SubProductTile({
    super.key,
    required this.response,
  });

  String? fundFormat() => (response.currency != null &&
          (response.currency!.jsonString == Currency.naira.jsonString))
      ? double.parse(response.minFund ?? '0').formatCurrencyNairaNum()
      : double.parse(response.minFund ?? '0').formatCurrencyDollarNum();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          response.title ?? AppStrings.na,
          style: AppTextStyles.body2Regular
              .copyWith(color: AppColors.primaryColor),
        ),
        Text(
          '${AppStrings.minFund} ${fundFormat() ?? AppStrings.na}',
          style: AppTextStyles.body1Regular
              .copyWith(color: AppColors.textBlack),
        ),
        SizedBox(height: 10.ah),
        Text(
          response.description ?? '-',
          style: AppTextStyles.body1Regular,
        ),
        SizedBox(height: 7.ah),
        Text(
          response.createdAt?.dateTimeReadable() ?? '-',
          style: AppTextStyles.body3Regular,
        ),
        SizedBox(height: 20.ah),
      ],
    );
  }
}
