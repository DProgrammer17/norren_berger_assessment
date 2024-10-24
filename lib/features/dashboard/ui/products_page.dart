import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/core/navigation.dart';
import 'package:norrenberger_assesment/features/dashboard/model/product_notifier.dart';
import 'package:norrenberger_assesment/features/dashboard/ui/product_details_page.dart';
import 'package:norrenberger_assesment/features/dashboard/ui/products_empty_page.dart';
import 'package:norrenberger_assesment/features/dashboard/widgets/product_tile.dart';
import 'package:norrenberger_assesment/features/login/ui/login.dart';
import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';
import 'package:norrenberger_assesment/widgets/page_widgets/app_scaffold.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_flat_button.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/empty_app_bar.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productNotifier.notifier).getProducts(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const EmptyAppBar(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Builder(
          builder: (ctx) {
            if (ref.watch(productNotifier).products != null &&
                ref.watch(productNotifier).products!.result != null &&
                ref.watch(productNotifier).products!.result!.isNotEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.ah),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      AppAssets.appLogo,
                      height: 40.ah,
                    ),
                  ),
                  SizedBox(height: 12.ah),
                  Text(
                    AppStrings.products,
                    style: AppTextStyles.h5.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 22.ah),
                  Expanded(
                    child: RefreshIndicator(
                      color: AppColors.primaryColor,
                      onRefresh: () => ref
                          .watch(productNotifier.notifier)
                          .getProducts(context),
                      child: ListView.separated(
                        itemBuilder: (_, index) => ProductTile(
                          response: ref
                                  .watch(productNotifier)
                                  .products
                                  ?.result
                                  ?.elementAt(index) ??
                              Result(),
                          onTap: () => context.pushSuper(
                            ProductDetailsPage(
                              res: ref
                                      .watch(productNotifier)
                                      .products
                                      ?.result
                                      ?.elementAt(index) ??
                                  Result(),
                            ),
                          ),
                        ),
                        separatorBuilder: (_, index) => Column(
                          children: [
                            SizedBox(height: 5.ah),
                            Divider(
                              thickness: 1.5.aw,
                              color: AppColors.primaryColor,
                            )
                          ],
                        ),
                        itemCount:
                            ref.watch(productNotifier).products?.result?.length ??
                                0,
                      ),
                    ),
                  ),
                  AppFlatButton(
                    onPressed: () =>
                        context.pushAndPopAllSuper(const Login()),
                    buttonTitle: AppStrings.logout,
                  ),
                  SizedBox(height: 22.ah),
                ],
              );
            }
            return EmptyProductsPage(
              onTap: () =>
                  ref.watch(productNotifier.notifier).getProducts(context),
            );
          },
        ),
      ),
    );
  }
}
