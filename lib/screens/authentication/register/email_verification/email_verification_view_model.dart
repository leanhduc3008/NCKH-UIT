import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../common/base/base_view_model.dart';
import '../../../../common/constants/theme.dart';
import '../register_success/register_success_page.dart';
import 'controller/count_down_controller.dart';

class EmailVerificationViewModel extends BaseViewModel<bool> {
  CountdownController countdownController = Get.find<CountdownController>();
  String? inputOtp = '';
  bool isEmailVerified = false;
  Timer? timer;

  @override
  Future<bool?> initialData() async {
    return null;
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
  }

  Future<void> resendEmailVerification() async {
    try {
      if (countdownController.maxCountDown == 0) {
        countdownController.resetToInitial();
        countdownController.startCountDownXSeconds(1);
        final user = FirebaseAuth.instance.currentUser!;
        await user.sendEmailVerification();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: AppColors.error);
    }
  }

  Future<void> checkEmailVerified() async {
    // call after email verification
    await FirebaseAuth.instance.currentUser!.reload();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    // print(isEmailVerified);

    if (isEmailVerified) {
      timer?.cancel();
      Get.offNamed(Get.currentRoute + RegisterSuccessPage.routePath);
    }
  }

  @override
  void onInit() {
    countdownController.startCountDownXSeconds(1);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    if (!isEmailVerified) {
      sendEmailVerification();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> confirm() async {
    Get.toNamed(Get.currentRoute + RegisterSuccessPage.routePath);
  }
}
