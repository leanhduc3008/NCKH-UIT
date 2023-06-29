import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/base/base_view_model.dart';
import '../model/air_quality.dart';
import '../repository/air_quality_repo.dart';

class AirQualityViewModel extends BaseViewModel<AirQuality> {
  final AirQualityRepository _repo = Get.find<AirQualityRepository>();
  var cityName;

  @override
  Future<AirQuality?> initialData() async {
    return _repo.getAqiHourly(
        cityName ?? 'HoChiMinh',
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('H').format(DateTime.now()));
  }
}
