import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/constants/app_strings.dart';
import 'package:norrenberger_assesment/constants/app_text_styles.dart';
import 'package:norrenberger_assesment/features/login/model/login_notifier.dart';
import 'package:norrenberger_assesment/utils/text_field_validator.dart';
import 'package:norrenberger_assesment/widgets/page_widgets/app_scaffold.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_flat_button.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/app_text_field.dart';
import 'package:norrenberger_assesment/widgets/utility_widgets/empty_app_bar.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: const EmptyAppBar(),
      isLoading: ref.watch(loginProvider).isLoading,
      body: Form(
        key: ref.watch(loginProvider).loginForm,
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
              AppStrings.welcomeToNorren,
              style: AppTextStyles.h4.copyWith(color: AppColors.primaryColor),
            ),
            SizedBox(height: 5.ah),
            Text(
              AppStrings.signInBelow,
              style: AppTextStyles.body2Regular,
            ),
            SizedBox(height: 35.ah),
            AppTextField(
              horizontalPadding: 0,
              controller: ref.watch(loginProvider).nameController,
              outerTitle: AppStrings.nameText,
              hintText: AppStrings.nameText2,
              obscureText: false,
              showOuterTile: true,
              maxLines: 1,
              inputType: TextInputType.name,
              textInputAction: TextInputAction.done,
              validator: (value) => TextfieldValidator.name(value),
            ),
            SizedBox(height: 7.ah),
            AppTextField(
              horizontalPadding: 0,
              controller: ref.watch(loginProvider).emailController,
              outerTitle: AppStrings.emailText,
              hintText: AppStrings.emailSubtitle,
              obscureText: false,
              showOuterTile: true,
              maxLines: 1,
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: (value) => TextfieldValidator.email(value),
            ),
            const Spacer(),
            AppFlatButton(
              onPressed: ()=> ref.watch(loginProvider.notifier).validateFields(context),
              buttonTitle: AppStrings.login,
            ),
            SizedBox(height: 22.ah),
          ],
        ),
      ),
    );
  }
}
