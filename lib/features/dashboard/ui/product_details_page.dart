import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/core/navigation.dart';
import 'package:norrenberger_assesment/features/dashboard/widgets/product_details_text.dart';
import 'package:norrenberger_assesment/features/dashboard/widgets/product_tile.dart';
import 'package:norrenberger_assesment/features/dashboard/widgets/sub_product_tile.dart';
import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';
import 'package:norrenberger_assesment/network/net_utils/enums/currency.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_number.dart';
import 'package:norrenberger_assesment/widgets/page_widgets/app_scaffold.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/empty_app_bar.dart';
import 'package:norrenberger_assesment/utils/extensions/extension_on_date_time.dart';

class ProductDetailsPage extends StatelessWidget {
  final Result res;
  const ProductDetailsPage({super.key, required this.res});

  String? fundFormat() => (res.currency != null &&
      (res.currency!.jsonString == Currency.naira.jsonString))
      ? (res.minFund ?? 0).formatCurrencyNairaNum()
      : (res.minFund ?? 0).formatCurrencyDollarNum();

  String? withdrawalFormat() => (res.currency != null &&
      (res.currency!.jsonString == Currency.naira.jsonString))
      ? (res.minWithrawal ?? 0).formatCurrencyNairaNum()
      : (res.minWithrawal ?? 0).formatCurrencyDollarNum();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutralWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: AppColors.primaryColor,
          onPressed: ()=> context.popSuper(),
        ),
        title: Row(
          children: [
            SizedBox(width: 100.aw),
            Image.asset(
              AppAssets.appLogo,
              height: 40.ah,
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20.ah),
          Text(
            res.productName ?? AppStrings.products,
            style: AppTextStyles.h5.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 22.ah),
          ProductDetailsText(
            title: AppStrings.productIDTitle,
            detail: res.productId ?? '-',
          ),
          SizedBox(height: 20.ah),
          ProductDetailsText(
            title: AppStrings.productCreatedAtTitle,
            detail: res.createdAt?.dateTimeReadable() ?? '-',
          ),
          SizedBox(height: 20.ah),
          ProductDetailsText(
            title: AppStrings.productDescriptionTitle,
            detail: res.description ?? '-',
          ),
          SizedBox(height: 20.ah),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductDetailsText(
                title: AppStrings.productMinWithdrawalTitle,
                detail: withdrawalFormat() ?? '##',
              ),
              SizedBox(width: 30.aw),
              ProductDetailsText(
                title: AppStrings.productMinFundTitle,
                detail: fundFormat() ?? '##',
              ),
            ],
          ),
          SizedBox(height: 20.ah),
          ProductDetailsText(
            title: AppStrings.productFeaturesTitle,
            detail: res.features ?? '-',
          ),
          SizedBox(height: 30.ah),
          if (res.subProduct != null && res.subProduct!.isNotEmpty) ...[
            Text(
              AppStrings.subProductsTitle,
              style: AppTextStyles.h5.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20.ah),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                res.subProduct!.length,
                (index) => SubProductTile(
                  response: res.subProduct!.elementAt(index),
                ),
              ),
            ),
            SizedBox(height: 20.ah),
          ],
        ],
      ),
    );
  }
}
