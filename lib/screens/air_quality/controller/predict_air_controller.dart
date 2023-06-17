import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/base/base_view_model.dart';
import '../model/predict_air_quality.dart';
import '../repository/air_quality_repo.dart';

class PredictAirController extends BaseViewModel<List<PredictAirQuality>> {
  final AirQualityRepository _repo = Get.find<AirQualityRepository>();
  String cityName = 'HoChiMinh';
  RxBool isDeepQLearning = true.obs;
  RxBool isArima = false.obs;
  RxBool isRNN = false.obs;
  RxBool isLoading = false.obs;
  RxList<PredictAirQuality> lstPredict = RxList();

  @override
  Future<List<PredictAirQuality>?> initialData() async {
    // print(DateFormat('E')
    //     .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse('2019-07-19 8:40:23')));
    // print(DateFormat('H').format(DateTime.now()));
    lstPredict.value = await _repo
        .getDeepQLPredictAqiHourly(DateFormat('H').format(DateTime.now()));
    return lstPredict;
  }

  Future<void> getDeepQLPredict() async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getDeepQLPredictAqiHourly(DateFormat('H').format(DateTime.now()));
    isLoading.value = false;
  }

  Future<void> getArimaPredict() async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getArimaPredictAqiHourly(DateFormat('H').format(DateTime.now()));
    isLoading.value = false;
  }

  Future<void> getRNNPredict() async {
    isLoading.value = true;
    lstPredict.value = await _repo
        .getRNNPredictAqiHourly(DateFormat('H').format(DateTime.now()));
    isLoading.value = false;
  }
}
