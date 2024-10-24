import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/core/navigation.dart';
import 'package:norrenberger_assesment/features/dashboard/ui/products_page.dart';
import 'package:norrenberger_assesment/features/login/model/login_vm.dart';
import 'package:norrenberger_assesment/features/login/ui/login_otp_page.dart';
import 'package:norrenberger_assesment/network/apis/login/login_api.dart';
import 'package:norrenberger_assesment/network/apis/login/requests/login_request.dart';
import 'package:norrenberger_assesment/network/apis/login/requests/verify_otp_requests.dart';
import 'package:norrenberger_assesment/widgets/extension/snack_bar_ext.dart';
import 'package:norrenberger_assesment/widgets/modal_widgets/modal_actions.dart';
import 'package:riverpod/riverpod.dart';

final loginProvider = NotifierProvider<LoginNotifier, LoginVM>(
  () => LoginNotifier(),
);

class LoginNotifier extends Notifier<LoginVM> {
  @override
  LoginVM build() => LoginVM(
        loginForm: GlobalKey<FormState>(),
        loginOTPForm: GlobalKey<FormState>(),
        emailController: TextEditingController(),
        nameController: TextEditingController(),
        otpController: TextEditingController(),
        otpFocusNode: FocusNode(),
      );

  void validateOTP(BuildContext context) {
    if (state.loginOTPForm.currentState!.validate() &&
        state.otpController.text.isNotEmpty) {
      verifyLoginOTP(context);
      return;
    }
    context.showToast(message: ErrorStrings.pleaseFillAllFields);
  }

  void validateFields(BuildContext context) {
    if (state.loginForm.currentState!.validate() &&
        state.emailController.text.isNotEmpty &&
        state.nameController.text.isNotEmpty) {
      login(context);
      return;
    }
    context.showToast(message: ErrorStrings.pleaseFillAllFields);
  }

  Future<void> login(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await LoginApi().loginCreateOTP(
        request: LoginRequest(
          email: state.emailController.text,
          name: state.nameController.text,
        ),
      );
      state = state.copyWith(isLoading: false);
      if(context.mounted){
        context.showToast(message: AppStrings.otpSentToMail);
        context.pushSuper(const LoginOtpPage());
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

  Future<void> verifyLoginOTP(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      await LoginApi().verifyLoginOTP(
        request: VerifyOtpRequest(
          otp: state.otpController.text,
          email: state.emailController.text,
        ),
      );
      state = state.copyWith(isLoading: false);
      if(context.mounted){
        context.showToast(message: AppStrings.otpVerified);
        context.pushAndPopAllSuper(const ProductsPage());
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
