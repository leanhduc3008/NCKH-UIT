import 'package:get/instance_manager.dart';
import '../authentication/repository/auth_repository.dart';
import '../authentication/repository/user_repository.dart';
import 'profile_view_model.dart';

class ProfileBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileViewModel());

    Get.put<UserRepostiory>(UserRepostiory());
    Get.put<AuthRepostiory>(AuthRepostiory());
  }
}
