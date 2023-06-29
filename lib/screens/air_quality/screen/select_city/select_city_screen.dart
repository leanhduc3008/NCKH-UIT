import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/constants/dimens.dart';
import '../../../../common/constants/images.dart';
import '../../../../common/constants/theme.dart';
import '../../../../common/extension/extenstion.dart';
import '../../../../widgets/progress/shimmer_progress.dart';
import '../../widgets/city_item.dart';
import 'select_city_view_model.dart';

class SelectCityScreen extends GetView<SelectCityViewModel> {
  const SelectCityScreen({super.key});

  static const String routePath = '/SelectCityScreen';

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      if (controller.status.isLoading) {
        return const Scaffold(
            backgroundColor: AppColors.white,
            body: LogoProgress(
              logo: AppImages.imgAirShimmer,
            ));
      }
      return Scaffold(
        backgroundColor: AppColors.bgTextFormField,
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
              size: 20,
            ),
            onPressed: Get.back,
          ),
        ),
        body: _buildBody(),
      );
    });
  }

  Widget _buildBody() {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return CityItem(
            location: controller.listCityName[index],
            aqi: controller.state![index].AQI,
            onPressed: () async {
              Get.back(result: controller.cityLists[index]);
              await controller.airQualityVMD?.onRefresh();
              await controller.predictAirQualityCTL?.onRefresh();
            });
      },
      itemCount: controller.state!.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
