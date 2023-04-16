import 'package:get/get.dart';

import 'detail_destination_viewmodel.dart';

class DetailDestinationBinder extends Bindings {
  @override
  void dependencies() {
    // Viewmodel
    Get.lazyPut(() => DetailDestinationViewModel());
  }
}
