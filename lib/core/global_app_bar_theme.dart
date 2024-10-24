import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';

const globalAppBarTheme = AppBarTheme(
  elevation: 0.0,
  foregroundColor: AppColors.primaryColor,
  backgroundColor: Color(0xffECECEC),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
);
