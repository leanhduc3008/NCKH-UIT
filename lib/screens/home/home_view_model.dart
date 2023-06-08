import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base/base_view_model.dart';
import '../../common/constants/images.dart';
import '../../data/model/destination.dart';
import '../authentication/repository/destination_repository.dart';
import '../chat/chat/chat_page.dart';

class HomeViewModel extends BaseViewModel<List<Destination?>>
    with GetSingleTickerProviderStateMixin {
  final DestinationRepository _desRepo = Get.find<DestinationRepository>();
  late TabController tabController = TabController(length: 2, vsync: this);
  final List<String> banner = [
    AppImages.imgDestination1,
    AppImages.imgDestination2,
    AppImages.imageNhaThoDucBa,
    AppImages.imgDestination3,
  ];
  List<Destination?> listDestination = [];
  late int current = 0;
  final CarouselController controller = CarouselController();

  Future<void> getToChat() async {
    Get.toNamed(Get.currentRoute + ChatPage.routePath);
  }

  @override
  Future<List<Destination?>> initialData() async {
    listDestination = await _desRepo.getListDestination();
    return listDestination;
  }
}
