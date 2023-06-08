import 'package:get/instance_manager.dart';

import '../../data/provider/city_provider.dart';
import '../../data/provider/destination_provider.dart';
import '../authentication/repository/destination_repository.dart';
import '../authentication/repository/post_repository.dart';
import '../authentication/repository/user_repository.dart';
import '../post/controller/create_post_controller.dart';
import '../post/controller/test_controller.dart';
import '../post/post_page_view_model.dart';
import '../profile/profile_view_model.dart';
import 'controller/destination_controller.dart';
import 'home_view_model.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    // Viewmodel
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => PostPageViewModel());

    // Provider
    Get.lazyPut(() => CityProvider());
    Get.lazyPut(() => DestinationProvider());

    // Controller
    Get.lazyPut(() => DestinationController());
    Get.lazyPut(() => CreatePostController(), fenix: true);
    Get.lazyPut(() => TestController(), fenix: true);

    // Repository
    Get.lazyPut(() => DestinationRepository());
    Get.lazyPut(() => PostRepository());
    Get.lazyPut(() => UserRepostiory(), fenix: true);
  }
}
