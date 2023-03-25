import 'package:get/get.dart';

import '../../data/provider/city_provider.dart';
import 'controller/city_lists_controller.dart';
import 'weather_view_model.dart';

class WeatherBinder extends Bindings {
  @override
  void dependencies() {
    Get.put<WeatherViewModel>(WeatherViewModel());
    Get.put<CityListsController>(CityListsController());
    Get.put<CityProvider>(CityProvider());
  }
}
