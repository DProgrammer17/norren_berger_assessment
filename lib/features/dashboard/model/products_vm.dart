import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';

class ProductsVM{
  final bool isLoading;
  final ProductResponse? products;

  const ProductsVM({
    this.isLoading = false,
    this.products,
});

  ProductsVM copyWith({
    bool? isLoading,
    ProductResponse? products,
  }) {
    return ProductsVM(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}