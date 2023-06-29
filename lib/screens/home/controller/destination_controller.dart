import 'package:get/get.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/model/destination.dart';
import '../../../data/provider/destination_provider.dart';
import '../../detail_destination/screen/detail_destination_page.dart';

class DestinationController extends BaseViewModel<List<Destination>> {
  final DestinationProvider _provider = Get.find<DestinationProvider>();

  @override
  Future<List<Destination>?> initialData() async {
    return _provider.getListDestination();
  }

  void getToDetailPage(Destination destination) {
    Get.toNamed(Get.currentRoute + DetailDestinationPage.routePath,
        arguments: destination);
  }
}
