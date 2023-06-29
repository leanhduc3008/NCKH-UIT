import 'package:get/get.dart';

import '../air_quality/repository/air_quality_repo.dart';
import 'list_city_and_province_view_model.dart';
import 'repository/city_tourism_repository.dart';

class ListCityAndProvinceBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListCityAndProvinceViewModel());
    Get.lazyPut(() => CityTourismRepository());
    Get.lazyPut(() => AirQualityRepository());
  }
}
