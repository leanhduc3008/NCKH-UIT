import 'package:get/instance_manager.dart';

import '../../data/provider/city_provider.dart';
import '../../data/provider/destination_provider.dart';
import '../profile/profile_view_model.dart';
import 'controller/destination_controller.dart';
import 'home_view_model.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    // Viewmodel
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut(() => ProfileViewModel());

    // Provider
    Get.lazyPut(() => CityProvider());
    Get.lazyPut(() => DestinationProvider());

    // Controller
    Get.lazyPut(() => DestinationController());
  }
}
