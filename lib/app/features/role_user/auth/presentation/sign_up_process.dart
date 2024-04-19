import 'package:flutter/material.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/sign_up_process_mobile_view.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpProcessMobileScreen(),
    );
  }
}
