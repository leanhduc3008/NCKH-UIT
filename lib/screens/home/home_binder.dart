import 'package:get/instance_manager.dart';

import '../../data/provider/city_provider.dart';
import '../profile/profile_view_model.dart';
import 'home_view_model.dart';

class HomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());
    Get.lazyPut(() => ProfileViewModel());
    Get.put<CityProvider>(CityProvider());

  }
}
