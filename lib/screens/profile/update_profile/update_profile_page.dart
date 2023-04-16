import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/appbar/app_navbar.dart';
import '../../../widgets/button/elevated_button.dart';
import '../../../widgets/input/app_text_form_field.dart';
import 'update_profile_view_model.dart';

class UpdateProfilePage extends GetView<UpdateProfileViewModel> {
  const UpdateProfilePage({super.key});

  static const String routePath = '/UpdateProfilePage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SimpleBuilder(
          builder: (_) => Scaffold(
              backgroundColor: const Color(0xFFF2F5FA),
              resizeToAvoidBottomInset: false,
              appBar: AppNavbar(
                leading: InkWell(
                  onTap: Get.back,
                  child: const SizedBox(
                      height: Dimens.s5,
                      width: Dimens.s5,
                      child: Icon(Icons.arrow_back_ios_new_outlined)),
                ),
                title: 'Cập nhật thông tin',
              ),
              body: SafeArea(
                child: Form(
                  key: controller.formKey,
                  child: Container(
                    decoration: const ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 50),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.l10n.username,
                              style: context.textStyle.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextFormField(
                            initialValue: controller.fullName,
                            validator: controller.validFullName,
                            onChanged: (String value) =>
                                controller.fullName = value,
                          ),
                          const SizedBox(height: 15),
                          Text('Số điện thoại',
                              style: context.textStyle.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextFormField(
                            initialValue: controller.phoneNumber,
                            validator: controller.validUsername,
                            onChanged: (String value) =>
                                controller.phoneNumber = value,
                          ),
                          const SizedBox(height: 15),
                          Text('Tuổi',
                              style: context.textStyle.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextFormField(
                            initialValue: controller.age,
                            validator: controller.validPosition,
                            onChanged: (String value) => controller.age = value,
                          ),
                          const SizedBox(height: 15),
                          Text('Email',
                              style: context.textStyle.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 5,
                          ),
                          AppTextFormField(
                            readOnly: true,
                            initialValue: controller.email,
                            validator: controller.validEmail,
                            onChanged: (String value) =>
                                controller.email = value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AppElevatedButton(
                      height: Dimens.s11,
                      backgroundColor: AppColors.darkGreen,
                      onPressed: controller.updateInfoUser,
                      child: Text(context.l10n.saveChange)))),
        ));
  }
}
