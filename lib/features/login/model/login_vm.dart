import 'package:flutter/material.dart';

class LoginVM {
  final GlobalKey<FormState> loginForm;
  final GlobalKey<FormState> loginOTPForm;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController otpController;
  final FocusNode otpFocusNode;
  final bool isLoading;

  const LoginVM({
    required this.loginForm,
    required this.loginOTPForm,
    required this.emailController,
    required this.nameController,
    required this.otpController,
    required this.otpFocusNode,
    this.isLoading = false,
  });

  LoginVM copyWith({
    GlobalKey<FormState>? loginForm,
    GlobalKey<FormState>? loginOTPForm,
    TextEditingController? emailController,
    TextEditingController? nameController,
    TextEditingController? otpController,
    FocusNode? otpFocusNode,
    bool? isLoading,
  }) {
    return LoginVM(
      isLoading: isLoading ?? this.isLoading,
      loginForm: loginForm ?? this.loginForm,
      loginOTPForm: loginOTPForm ?? this.loginOTPForm,
      emailController: emailController ?? this.emailController,
      nameController: nameController ?? this.nameController,
      otpController: otpController ?? this.otpController,
      otpFocusNode: otpFocusNode ?? this.otpFocusNode,
    );
  }
}
