
import 'package:norrenberger_assesment/network/exceptions/api_exception.dart';

class GroundException extends ApiException {
  final String exception;
  GroundException(this.exception);

  @override
  String get errorMessage => exception;
}