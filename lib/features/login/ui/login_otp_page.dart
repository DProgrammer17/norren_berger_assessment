import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/features/login/model/login_notifier.dart';
import 'package:norrenberger_assesment/widgets/page_widgets/app_scaffold.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_flat_button.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/empty_app_bar.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/pin_input_field.dart';

class LoginOtpPage extends ConsumerWidget {
  const LoginOtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: const EmptyAppBar(),
      isLoading: ref.watch(loginProvider).isLoading,
      body: Form(
        key: ref.watch(loginProvider).loginOTPForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.ah),
            Image.asset(
              AppAssets.appLogo,
              height: 40.ah,
            ),
            SizedBox(height: 12.ah),
            Text(
              AppStrings.hiUsername(
                  ref.watch(loginProvider).nameController.text),
              style: AppTextStyles.h5.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              AppStrings.pleaseFillOTPBelow,
              style: AppTextStyles.body2Regular,
            ),
            SizedBox(height: 60.ah),
            PinInputField(
              controller: ref.watch(loginProvider).otpController,
              focusNode: ref.watch(loginProvider).otpFocusNode,
              length: 4,
              onEditingComplete: (pin){
                if(pin.length == 4){
                  ref.watch(loginProvider.notifier).validateOTP(context);
                }
              },
              onComplete: () =>
                  ref.watch(loginProvider.notifier).validateOTP(context),
            ),
            const Spacer(),
            AppFlatButton(
              onPressed: () =>
                  ref.watch(loginProvider.notifier).validateOTP(context),
              buttonTitle: AppStrings.login,
            ),
            SizedBox(height: 22.ah),
          ],
        ),
      ),
    );
  }
}
