import 'package:flutter/material.dart';
import 'package:norrenberger_assesment/constants/app_assets.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';
import 'package:norrenberger_assesment/core/navigation.dart';
import 'package:norrenberger_assesment/features/login/ui/login.dart';
import 'package:norrenberger_assesment/features/login/ui/login_otp_page.dart';
import 'package:norrenberger_assesment/widgets/page_widgets/app_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    navAction();
    super.initState();
  }

  void navAction()async{
    Future.delayed(
      const Duration(milliseconds: 2000),
          () => context.pushSuper(const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          SizedBox(height: 130.ah),
          Image.asset(AppAssets.appLogo),
        ],
      ),
    );
  }
}
