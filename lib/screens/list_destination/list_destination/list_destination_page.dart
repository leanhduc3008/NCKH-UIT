import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../detail_destination/screen/detail_destination_page.dart';
import '../widget/destionation_item.dart';
import 'list_destination_view_model.dart';

class ListDestinationPage extends GetView<ListDestinationViewModel> {
  const ListDestinationPage({super.key});

  static const String routePath = '/ListDestination';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgTextFormField,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Text(controller.cityName['cityName']),
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
  }

  Widget _buildBody() {
    return controller.builder((state) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            clipBehavior: Clip.none,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () => Get.toNamed(
                  Get.currentRoute + DetailDestinationPage.routePath,
                  arguments: controller.state![index]),
              child: DestinationItem(
                imageUrl: controller.state?[index].imageUrl ?? '',
                name: controller.state?[index].name ?? '',
                location: controller.state?[index].location ?? '',
                iconWeather: (controller.state?[index].weather == 'Có Mưa')
                    ? AppImages.icRain
                    : (controller.state?[index].weather == 'Có Mây')
                        ? AppImages.icCloud
                        : (controller.state?[index].weather == 'Nắng Đẹp')
                            ? AppImages.icSun
                            : (controller.state?[index].weather == 'Có Nắng')
                                ? AppImages.icCloudSun
                                : AppImages.icRain,
                weather: controller.state?[index].weather ?? '',
                aqi: controller.cityName['aqi'],
                onPressed: () {},
              ),
            ),
            itemCount: controller.state!.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 20,
            ),
          ),
        ));
  }
}
