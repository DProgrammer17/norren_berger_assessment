import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/features/dashboard/model/products_vm.dart';
import 'package:norrenberger_assesment/network/apis/product/product_api.dart';
import 'package:norrenberger_assesment/widgets/extension/snack_bar_ext.dart';
import 'package:norrenberger_assesment/widgets/modal_widgets/modal_actions.dart';

final productNotifier = NotifierProvider<ProductNotifier, ProductsVM>(
      () => ProductNotifier(),
);

class ProductNotifier extends Notifier<ProductsVM>{
  @override
  ProductsVM build()=> const ProductsVM();

  Future<void> getProducts(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      var apiResponse = await ProductApi().getProducts();
      state = state.copyWith(isLoading: false, products: apiResponse);
      if(context.mounted){
        context.showToast(message: AppStrings.productsRetrievedSuccessfully);
      }
    } catch (error, _) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        showModalActionError(
          context: context,
          errorText: error.toString(),
        );
      }
    }
  }

}