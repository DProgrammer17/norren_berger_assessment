import 'package:dio/dio.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/network/api_path.dart';
import 'package:norrenberger_assesment/network/apis/product/response/product_response.dart';
import 'package:norrenberger_assesment/network/exceptions/data_transformer.dart';
import 'package:norrenberger_assesment/network/exceptions/api_exception.dart';
import 'package:norrenberger_assesment/network/net_utils/dio_network_provider.dart';
import 'package:norrenberger_assesment/network/net_utils/headers.dart';

class ProductApi{
  static final _tokenProvider = AppNetworkProvider();

  Future<ProductResponse> getProducts() async {
    final response = await _tokenProvider.call(
      path: ApiPath.getProductDetails,
      method: RequestMethod.get,
      options: Options(
        headers: ApiHeaders.requestHeader,
      ),
    );

    final res = processData((p0) => ProductResponse.fromJson(p0), response);
    res.either(
          (left) => throw ApiException(
          message: res.left.message ?? ErrorStrings.exceptionMessage),
          (right) {},
    );

    return res.right;
  }

}