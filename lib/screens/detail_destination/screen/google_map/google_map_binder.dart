import 'package:get/get.dart';

import 'google_map_view_model.dart';

class GoogleMapBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleMapViewModel());
  }
}
