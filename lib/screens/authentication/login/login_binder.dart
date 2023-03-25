import 'package:get/instance_manager.dart';

import '../repository/auth_repository.dart';
import '../repository/user_repository.dart';
import 'login_view_model.dart';

class LoginBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginViewModel>(LoginViewModel());
    Get.put<UserRepostiory>(UserRepostiory());
    Get.put<AuthRepostiory>(AuthRepostiory());
  }
}
