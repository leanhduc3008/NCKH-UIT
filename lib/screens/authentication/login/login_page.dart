import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/context_extension.dart';
import '../../../widgets/button/elevated_button.dart';
import 'login_view_model.dart';
import 'widget/text_field_email.dart';
import 'widget/text_field_password.dart';

class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({super.key});

  static const String routePath = '/LoginPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(LoginPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Form(
        key: controller.formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          body: Stack(children: [
            Container(
              color: AppColors.blueText,
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppImages.bgTourismApp,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 8 / 10,
                left: MediaQuery.of(context).size.width / 4,
                child: Image.asset(AppImages.imageAppName)),
            Positioned(
                top: MediaQuery.of(context).size.height * 2.5 / 10,
                left: 30,
                right: 30,
                bottom: 120,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const ShapeDecoration(
                      color: Color(0xFFF2F5FA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldLoginCustom(
                            validator: controller.validEmail,
                            hintText: context.l10n.enterYourEmail,
                            onChanged: (String value) =>
                                controller.email = value,
                          ),
                          const SizedBox(height: 15),
                          TextFieldLoginPassword(
                            maxLength: null,
                            validator: controller.validPassword,
                            hintText: context.l10n.enterYourPassword,
                            onChanged: (String value) =>
                                controller.password = value,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context.l10n.forgotPassword,
                                style: context.textStyle.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grayText),
                              )
                            ],
                          ),
                          const SizedBox(height: 40),
                          AppElevatedButton(
                              height: Dimens.s11,
                              backgroundColor: AppColors.dark,
                              onPressed: controller.onSubmit,
                              child: Text(context.l10n.login)),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: context.l10n.dontHaveAccount,
                              style: context.textStyle.bodyMedium
                                  ?.copyWith(color: AppColors.dark),
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.toRegisterPage();
                                      },
                                    text: context.l10n.registerNow,
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(color: AppColors.blueText)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
