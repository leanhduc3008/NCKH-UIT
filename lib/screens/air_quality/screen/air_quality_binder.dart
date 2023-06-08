import 'package:get/get.dart';

import 'air_quality_view_model.dart';

class AirQualityBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirQualityViewModel());
  }
}
