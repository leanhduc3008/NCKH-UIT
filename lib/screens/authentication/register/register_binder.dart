import 'package:get/instance_manager.dart';

import 'email_verification/controller/count_down_controller.dart';
import 'register_view_model.dart';

class RegisterBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterViewModel>(RegisterViewModel());
    Get.put<CountdownController>(CountdownController());
  }
}
