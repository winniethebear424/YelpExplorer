import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/layout/mobile/sign_up_payment_mobile_view/sign_up_payment_button.dart';
import 'package:ninjafood/app/widgets/custom_appbar.dart';

class SignUpPaymentMobileView extends GetView<SignUpProcessController> {
  const SignUpPaymentMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(),
      // onPressBackButton: controller.onPressBack,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding.small(),
                AppPadding(
                  padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                  child: AppText.headlineSmall(
                      fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: 'PaymentMethodScreen_Title'.tr),
                ),
                AppPadding.medium(
                  child: AppText.bodyMedium(
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      text: 'PaymentMethodScreen_Description'.tr),
                ),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: AppPadding.medium(child: AppIcons.paypal()),
                    )),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: AppIcons.visa(),
                    )),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: AppPadding.medium(child: AppIcons.payOneer()),
                    )),
              ],
            ),
          ),
          SafeArea(
            child: AppPadding.regular(
              child: AppButton.max(title: 'Next_Button'.tr, onPressed: controller.onPressedNextPayment),
            ),
          ),
        ],
      ),
    );
  }
}
