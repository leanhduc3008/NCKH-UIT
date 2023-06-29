import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../router/route_menu.dart';
import '../../../widgets/progress/shimmer_progress.dart';
import '../widgets/air_card.dart';
import '../widgets/list_predict_air.dart';
import 'air_quality_view_model.dart';
import 'select_city/select_city_screen.dart';

class AirQualityPage extends GetView<AirQualityViewModel> {
  const AirQualityPage({super.key});

  static const String routePath = '/AirQualityPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(AirQualityPage.routePath);
  }

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
      return RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: RouteMenu.drawer,
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
      );
    });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: AppColors.transparentColor,
      centerTitle: true,
      backgroundColor: AppColors.transparentColor,
      foregroundColor: AppColors.white,
      actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.apps,
              size: 30,
            ),
            onPressed: () async {
              controller.cityName = await Get.toNamed(
                  Get.currentRoute + SelectCityScreen.routePath);
            }),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    if (controller.cityName != null) {
    controller.onRefresh();
    }
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: 700,
            width: double.infinity,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                const Color(0xFF3D3D3D).withOpacity(0.1),
                BlendMode.darken,
              ),
              child: Image.asset(
                AppImages.imgAirBg,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Column(
                children: [
                  Text(
                    cityName,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4.0,
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateTime.now().toDateString,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4.0,
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateFormat('E').format(DateTime.now()),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4.0,
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  10.gapHeight,
                  Image.asset(
                    (controller.state!.AQI <= 50)
                        ? AppImages.imgGoodAir
                        : (controller.state!.AQI > 50) &&
                                (controller.state!.AQI <= 100)
                            ? AppImages.imgModerateAir
                            : (controller.state!.AQI > 100) &&
                                    (controller.state!.AQI <= 150)
                                ? AppImages.imgQuiteUnhealthyAir
                                : (controller.state!.AQI > 150) &&
                                        (controller.state!.AQI <= 200)
                                    ? AppImages.imgBadAir
                                    : (controller.state!.AQI > 200) &&
                                            (controller.state!.AQI <= 300)
                                        ? AppImages.imgExtremelyUnhealthy
                                        : AppImages.imgDangerous,
                    width: 90,
                    height: 90,
                  ),
                  Text(
                    'AQI ${controller.state?.AQI}',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4.0,
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    (controller.state!.AQI <= 50)
                        ? 'Tình trạng tốt'
                        : (controller.state!.AQI > 50) &&
                                (controller.state!.AQI <= 100)
                            ? 'Tình trạng trung bình'
                            : (controller.state!.AQI > 100) &&
                                    (controller.state!.AQI <= 150)
                                ? 'Tình trạng kém'
                                : (controller.state!.AQI > 150) &&
                                        (controller.state!.AQI <= 200)
                                    ? 'Tình trạng xấu'
                                    : (controller.state!.AQI > 200) &&
                                            (controller.state!.AQI <= 300)
                                        ? 'Tình trạng rất xấu'
                                        : 'Tình trạng nguy hiểm',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4.0,
                          color: AppColors.black.withOpacity(0.25),
                        ),
                      ],
                    ),
                  ),
                  20.gapHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AirCard(
                          title: 'PM2.5', aqi: controller.state?.pm2_5 ?? 0),
                      AirCard(
                        title: 'PM10',
                        aqi: controller.state?.pm10 ?? 0,
                      ),
                      AirCard(
                        title: 'O3',
                        aqi: controller.state?.o3 ?? 0,
                      )
                    ],
                  ),
                  20.gapHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AirCard(
                        title: 'SO2',
                        aqi: controller.state?.so2 ?? 0,
                      ),
                      AirCard(
                        title: 'NO2',
                        aqi: controller.state?.no2 ?? 0,
                      ),
                      AirCard(
                        title: 'CO',
                        aqi: controller.state?.co ?? 0,
                      )
                    ],
                  ),
                  30.gapHeight,
                  Container(
                      height: 240,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 25),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                          color: const Color(0xFF63C9C9),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.02),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ]),
                      child: ListPredictAir(
                        cityName: controller.cityName ?? 'HoChiMinh',
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String get cityName {
    switch (controller.cityName) {
      case 'HoChiMinh':
        return 'Hồ Chí Minh';
      case 'HaNoi':
        return 'Hà Nội';
      case 'DaNang':
        return 'Đà Nẵng';
      case 'VungTau':
        return 'Vũng Tàu';
      case 'SaPa':
        return 'Sa Pa';
      case 'ThuaThienHue':
        return 'Thừa Thiên Huế';
      case 'NhaTrang':
        return 'Nha Trang';
      case 'PhuQuoc':
        return 'Phú Quốc';
      case 'HaLong':
        return 'Hạ Long';
      case 'DaLat':
        return 'Đà Lạt';
      default:
        return 'Hồ Chí Minh';
    }
  }
}
