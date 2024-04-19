import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/forgot_password_controller.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';
import 'reset_password_box_email.dart';

class ResetPasswordMobileView extends GetView<ForgotPassWordController> {
  const ResetPasswordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget:
          CustomAppBar.back(title: 'ResetPassword_Title'.tr),
      // wrapBodyWithSafeArea: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppPadding.medium(
            child: AppText.bodyMedium(
                text: 'ResetPassword_Description'.tr,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start),
          ),
          AppPadding.medium(child: ResetPasswordBoxEmail()),
          AppPadding.regular(
            child: AppButton.max(
                title: 'ResetPassword_Send_Button'.tr,
                onPressed: controller.onPressedSend),
          ),
        ],
      ),
    );
  }
}
