import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/images.dart';
import '../chat/chat/chat_page.dart';

class HomeViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  final List<String> banner = [
    AppImages.imgDestination1,
    AppImages.imgDestination2,
    AppImages.imageNhaThoDucBa,
    AppImages.imgDestination3,
  ];
  final List<String> destinationName = [
    'Nhà thờ Đức Bà',
    'Lang Biang',
    'Đồi Mây Đắng',
    'Dinh Độc Lập',
  ];
  late int current = 0;
  final CarouselController controller = CarouselController();

  Future<void> getToChat() async {
    Get.toNamed(Get.currentRoute + ChatPage.routePath);
  }
}
