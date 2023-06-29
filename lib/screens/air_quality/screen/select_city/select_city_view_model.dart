import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/base/base_view_model.dart';
import '../../../../common/extension/extenstion.dart';
import '../../controller/predict_air_controller.dart';
import '../../model/air_quality.dart';
import '../../repository/air_quality_repo.dart';
import '../air_quality_view_model.dart';

class SelectCityViewModel extends BaseViewModel<List<AirQuality>> {
  final AirQualityRepository _airQualityRepo = Get.find<AirQualityRepository>();
  final airQualityVMD = Get.tryFind<AirQualityViewModel>();
  final predictAirQualityCTL = Get.tryFind<PredictAirController>();
  List<String> cityLists = [
    'HoChiMinh',
    'HaNoi',
    'DaNang',
    'VungTau',
    'SaPa',
    'ThuaThienHue',
    'NhaTrang',
    'PhuQuoc',
    'HaLong',
    'DaLat'
  ];
  List<String> listCityName = [
    'Hồ Chí Minh',
    'Hà Nội',
    'Đà Nẵng',
    'Vũng Tàu',
    'Sa Pa',
    'Thừa Thiên Huế',
    'Nha Trang',
    'Phú Quốc',
    'Hạ Long',
    'Đà Lạt'
  ];
  @override
  Future<List<AirQuality>> initialData() {
    return _airQualityRepo.getListAqiHourly(
        cityLists,
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('H').format(DateTime.now()));
  }
}
