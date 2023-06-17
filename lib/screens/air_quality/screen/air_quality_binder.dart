import 'package:get/get.dart';

import '../controller/predict_air_controller.dart';
import '../repository/air_quality_repo.dart';
import 'air_quality_view_model.dart';

class AirQualityBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AirQualityViewModel(), fenix: true);
    Get.lazyPut(() => AirQualityRepository(), fenix: true);
    Get.lazyPut(() => PredictAirController(), fenix: true);
  }
}
