import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/constants/theme.dart';
import '../../../../common/extension/context_extension.dart';
import '../register_success/register_success_page.dart';
import 'email_verification_view_model.dart';

class EmailVerificationPage extends GetView<EmailVerificationViewModel> {
  const EmailVerificationPage({super.key});

  static const String routePath = '/EmailVerificationPage';

  @override
  Widget build(BuildContext context) {
    controller.timer = Timer.periodic(
        const Duration(seconds: 3), (_) => controller.checkEmailVerified());
    return SimpleBuilder(
        builder: (_) => controller.isEmailVerified
            ? const RegisterSuccessPage()
            : Scaffold(
                backgroundColor: AppColors.white,
                body: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.pleaseConfirmEmail,
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium?.copyWith(
                              color: AppColors.grayText,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CircularProgressIndicator(),
                        const SizedBox(
                          height: 15,
                        ),
                        SimpleBuilder(
                          builder: (_) => RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: context.textStyle.bodyMedium
                                      ?.copyWith(color: AppColors.grayColor),
                                  children: [
                                    TextSpan(text: context.l10n.notReceiveOtp),
                                    TextSpan(
                                        text: context.l10n.resend,
                                        style: context.textStyle.bodyMedium
                                            ?.copyWith(
                                                color: controller
                                                            .countdownController
                                                            .state ==
                                                        0
                                                    ? AppColors.blueText
                                                    : AppColors.grayColor,
                                                fontWeight: FontWeight.w500),
                                        // Click here to re-send email
                                        recognizer: controller
                                                    .countdownController
                                                    .state ==
                                                0
                                            ? (TapGestureRecognizer()
                                              ..onTap = () {
                                                controller
                                                    .resendEmailVerification();
                                              })
                                            : null),
                                    TextSpan(
                                        text: controller.countdownController
                                                    .state ==
                                                0
                                            ? ''
                                            : ' sau ${controller.countdownController.state} giây',
                                        style: context.textStyle.bodyMedium
                                            ?.copyWith(
                                                color: AppColors.grayColor,
                                                fontWeight: FontWeight.w400))
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
