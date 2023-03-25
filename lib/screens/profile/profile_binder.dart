import 'package:get/instance_manager.dart';
import 'profile_view_model.dart';

class ProfileBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileViewModel()); 
  }
}
