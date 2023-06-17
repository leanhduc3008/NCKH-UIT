import 'package:get/get.dart';

import '../../data/provider/city_provider.dart';
import 'controller/city_lists_controller.dart';
import 'weather_view_model.dart';

class WeatherBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherViewModel(), fenix: true);
    Get.lazyPut(() => CityListsController(), fenix: true);
    Get.lazyPut(() => CityProvider(), fenix: true);
  }
}
