import 'package:get/get.dart';
import 'update_profile_view_model.dart';

class UpdateProfileBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateProfileViewModel());
  }
}
