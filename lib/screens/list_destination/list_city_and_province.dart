import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import 'list_city_and_province_view_model.dart';
import 'list_destination/list_destination_page.dart';
import 'widget/province_city_item.dart';

class ListCityAndProvince extends GetView<ListCityAndProvinceViewModel> {
  const ListCityAndProvince({super.key});

  static const String routePath = '/ListCityAndProvince';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTextFormField,
      drawer: RouteMenu.drawer,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: const Text('Chọn vùng du lịch bạn muốn xem'),
        centerTitle: false,
        titleSpacing: Dimens.s2,
        titleTextStyle:
            context.textStyle.titleMedium?.copyWith(color: AppColors.black),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return controller.builder((state) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context, index) => ProvinceAndCityItem(
                  aqi: controller.listAqi[index].AQI,
                  bgImage: controller.state?[index].image ?? '',
                  iconWeather: (controller.state?[index].weather == 'Mưa nhẹ' ||
                          controller.state?[index].weather == 'Có mưa')
                      ? AppImages.imgRain
                      : AppImages.imgCloud,
                  location: controller.state?[index].cityName ?? '',
                  weather: controller.state?[index].weather ?? '',
                  onPressed: () => Get.toNamed(
                      Get.currentRoute + ListDestinationPage.routePath,
                      arguments: {
                        'cityName': controller.state?[index].cityName,
                        'aqi': controller.listAqi[index].AQI
                      }),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: controller.state!.length),
      );
    });
  }
}
