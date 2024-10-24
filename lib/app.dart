import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/core/global_app_bar_theme.dart';
import 'package:norrenberger_assesment/features/splash_page.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
        const Size(AppConstants.designWidth, AppConstants.designHeight),
        splitScreenMode: false,
        builder: (context, child) {
          return OverlaySupport.global(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemStatusBarContrastEnforced: true,
              ),
              child: MaterialApp(
                title: AppStrings.appTitle,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: false,
                  appBarTheme: globalAppBarTheme,
                  primaryColor: AppColors.primaryColor,
                  scaffoldBackgroundColor: AppColors.neutralWhite,
                ),
                home: const SplashPage(),
              ),
            ),
          );
        });
  }

}