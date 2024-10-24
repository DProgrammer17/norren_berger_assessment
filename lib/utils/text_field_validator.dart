import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/utils/string_regex.dart';

abstract class TextfieldValidator {
  /// validates the TextField that receives a name
  static String? name(String? value) {
    RegExp regExp = RegExp(StringRegex.personName);
    if (value == null || value.length < 2) {
      return ErrorStrings.textValidateShort;
    }
    if (value.isEmpty) {
      return ErrorStrings.textValidateEmpty;
    }
    if (!regExp.hasMatch(value)) {
      return ErrorStrings.textValidateName;
    }
    return null;
  }

  static String? businessName(String? value) {
    if (value == null || value.length < 2) {
      return ErrorStrings.textValidateShort;
    }
    if (value.isEmpty) {
      return ErrorStrings.textValidateEmpty;
    }

    return null;
  }

  /// validates the TextField that receives an input
  static String? input(String? value, [String? validationError]) {
    if (value == null || value.length < 3) {
      return validationError ?? ErrorStrings.textValidateShort;
    }
    if (value.isEmpty) {
      return ErrorStrings.textValidateEmpty;
    }
    return null;
  }

  /// validates the TextField that receives a pin
  static String? pin(String? value) {
    if (value == null || (value.length < 4 || value.length > 6)) {
      return 'Invalid pin';
    }
    if (value.isEmpty) {
      return 'Pin cannot be empty';
    }
    return null;
  }

  /// validates the TextField that receives a pin
  static String? confirmPin({required String pin, String? value}) {
    if (value == null || (value.length < 4 || value.length > 6)) {
      return 'Invalid pin';
    }
    if (value.isEmpty) {
      return 'Pin cannot be empty';
    }

    if (value != pin) {
      return 'Pins do not match';
    }
    return null;
  }

  /// validates the OTP Field that receives an input
  static String? otpValidator(String? value, [int? length]) {
    if (value == null || value.length < (length ?? 4)) {
      return 'invalid OTP';
    }
    if (value.isEmpty) {
      return 'cannot be empty';
    }
    return null;
  }


  /// validates the TextField that receives the email
  static String? email(String? value) {
    if (value != null) {
      final isValid = RegExp(StringRegex.email).hasMatch(value);
      if (!isValid) return ErrorStrings.invalidEmail;
    }
    return null;
  }

  /// validates the TextField that receives the password
  static String? password(String? value) {
    if (value != null) {
      final upperCase = RegExp(StringRegex.passUpperCase).hasMatch(value);
      final lowerCase = RegExp(StringRegex.passLowerCase).hasMatch(value);
      final symbol = RegExp(StringRegex.passSymbol).hasMatch(value);
      final digits = RegExp(StringRegex.passNumber).hasMatch(value);
      final min8char = RegExp(StringRegex.pass8Chars).hasMatch(value);

      if (!digits) return 'Must have a number';
      if (!upperCase) return 'Must have an upper case letter';
      if (!lowerCase) return 'Must have a lower case letter';
      if (!symbol) return 'Must have a symbol';
      if (!min8char) return 'Must have at least 8 characters';
    }
    return null;
  }

  /// validates the TextField that receives the password and ensures it matches the comparison
  static String? confirmPassword({required String password, String? value}) {
    if (value != null) {
      final upperCase = RegExp(StringRegex.passUpperCase).hasMatch(value);
      final lowerCase = RegExp(StringRegex.passLowerCase).hasMatch(value);
      final symbol = RegExp(StringRegex.passSymbol).hasMatch(value);
      final digits = RegExp(StringRegex.passNumber).hasMatch(value);
      final min8char = RegExp(StringRegex.pass8Chars).hasMatch(value);

      if (!upperCase) return 'Must have an upper case letter';
      if (!lowerCase) return 'Must have a lower case letter';
      if (!symbol) return 'Must have a symbol';
      if (!digits) return 'Must have a number';
      if (!min8char) return 'Must have at least 8 characters';

      if (value != password) {
        return 'Passwords do not match';
      }
    }

    return null;
  }
}
