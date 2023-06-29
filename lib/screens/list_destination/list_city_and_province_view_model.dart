import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/base/base_view_model.dart';
import '../air_quality/model/air_quality.dart';
import '../air_quality/repository/air_quality_repo.dart';
import 'model/city_tourism.dart';
import 'repository/city_tourism_repository.dart';

class ListCityAndProvinceViewModel extends BaseViewModel<List<CityTourism>> {
  final CityTourismRepository _cityRepo = Get.find<CityTourismRepository>();
  final AirQualityRepository _airQualityRepo = Get.find<AirQualityRepository>();
  List<AirQuality> listAqi = [];
  List<String> cityLists = [
    'DaNang',
    'NhaTrang',
    'DaLat',
    'ThuaThienHue',
    'PhuQuoc',
    'HaNoi',
    'SaPa',
    'HaLong',
    'HoChiMinh',
    'VungTau'
  ];

  @override
  Future<List<CityTourism>?> initialData() async {
    listAqi = await _airQualityRepo.getListAqiHourly(
        cityLists,
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('H').format(DateTime.now()));
    return _cityRepo.getListCities();
  }
}
