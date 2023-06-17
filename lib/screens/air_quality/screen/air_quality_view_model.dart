import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/base/base_view_model.dart';
import '../model/air_quality.dart';
import '../repository/air_quality_repo.dart';

class AirQualityViewModel extends BaseViewModel<AirQuality> {
  final AirQualityRepository _repo = Get.find<AirQualityRepository>();
  String cityName = 'HoChiMinh';

  @override
  Future<AirQuality?> initialData() {
    return _repo.getAqiHourly(
        cityName,
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('H').format(DateTime.now()));
  }
}
