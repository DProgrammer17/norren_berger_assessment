
import 'package:norrenberger_assesment/network/exceptions/api_exception.dart';

class ObjectParseException extends ApiException {
   ObjectParseException();

  @override
  String get errorMessage => 'We encountered a problem trying to reach the server. We are working to fix it...';
}