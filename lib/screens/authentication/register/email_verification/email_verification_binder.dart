import 'package:get/instance_manager.dart';

import 'email_verification_view_model.dart';

class EmailVerificationBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<EmailVerificationViewModel>(EmailVerificationViewModel());
  }
}
