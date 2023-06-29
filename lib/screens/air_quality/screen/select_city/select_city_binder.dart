import 'package:get/get.dart';

import '../../repository/air_quality_repo.dart';
import 'select_city_view_model.dart';

class SelectCityBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCityViewModel());
    Get.lazyPut(() => AirQualityRepository());
  }
}
