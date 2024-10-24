import 'package:dio/dio.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/network/api_path.dart';
import 'package:norrenberger_assesment/network/apis/login/requests/login_request.dart';
import 'package:norrenberger_assesment/network/apis/login/requests/verify_otp_requests.dart';
import 'package:norrenberger_assesment/network/apis/login/response/login_response.dart';
import 'package:norrenberger_assesment/network/apis/login/response/verify_otp_response.dart';
import 'package:norrenberger_assesment/network/exceptions/data_transformer.dart';
import 'package:norrenberger_assesment/network/net_utils/dio_network_provider.dart';
import 'package:norrenberger_assesment/network/net_utils/headers.dart';

import '../../exceptions/api_exception.dart';

class LoginApi{
  static final _tokenProvider = AppNetworkProvider();

  Future<LoginResponse> loginCreateOTP({required LoginRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.createEmailOTP,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(
        headers: ApiHeaders.requestHeader,
      ),
    );

    final res = processData((p0) => LoginResponse.fromJson(p0), response);
    res.either(
          (left) => throw ApiException(
          message: res.left.message ?? ErrorStrings.exceptionMessage),
          (right) {},
    );

    return res.right;
  }

  Future<VerifyOtpResponse> verifyLoginOTP({required VerifyOtpRequest request}) async {
    final response = await _tokenProvider.call(
      path: ApiPath.verifyEmailOTP,
      method: RequestMethod.post,
      body: request.toJson(),
      options: Options(
        headers: ApiHeaders.requestHeader,
      ),
    );

    final res = processData((p0) => VerifyOtpResponse.fromJson(p0), response);
    res.either(
          (left) => throw ApiException(
          message: res.left.message ?? ErrorStrings.exceptionMessage),
          (right) {},
    );

    return res.right;
  }


}