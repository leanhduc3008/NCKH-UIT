import 'package:get/get.dart';

import '../controller/city_lists_controller.dart';

class CityListBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityListsController(), fenix: true);
  }
}
