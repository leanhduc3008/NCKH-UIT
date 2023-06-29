import 'package:get/get.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/model/destination.dart';
import '../../authentication/repository/destination_repository.dart';

class ListDestinationViewModel extends BaseViewModel<List<Destination>> {
  final DestinationRepository _repo = Get.find<DestinationRepository>();
  final Map<String, dynamic> cityName = Get.arguments; 

  @override
  Future<List<Destination>> initialData() async {
    return _repo.getListDestinationByCity(cityName['cityName']);
  }
}
