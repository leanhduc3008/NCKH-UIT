import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../router/route_menu.dart';
import '../widgets/air_card.dart';
import '../widgets/predict_air_col.dart';
import 'air_quality_view_model.dart';

class AirQualityPage extends GetView<AirQualityViewModel> {
  const AirQualityPage({super.key});

  static const String routePath = '/AirQualityPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(AirQualityPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: RouteMenu.drawer,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.transparentColor,
      foregroundColor: AppColors.white,
      title: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Hồ Chí Minh',
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
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
                AppImages.imgHCM,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 140, 16, 0),
              child: Column(
                children: [
                  Image.asset(
                    AppImages.imgQuiteUnhealthyAir,
                    width: 90,
                    height: 90,
                  ),
                  Text(
                    'AQI 125',
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
                    'Tình trạng xấu',
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
                    children: const [
                      AirCard(title: 'PM2.5', aqi: 65.6),
                      AirCard(
                        title: 'PM10',
                        aqi: 79.2,
                      ),
                      AirCard(
                        title: 'O3',
                        aqi: 0,
                      )
                    ],
                  ),
                  20.gapHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      AirCard(
                        title: 'SO2',
                        aqi: 42.9,
                      ),
                      AirCard(
                        title: 'NO2',
                        aqi: 34.3,
                      ),
                      AirCard(
                        title: 'CO',
                        aqi: 1762.4,
                      )
                    ],
                  ),
                  30.gapHeight,
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.blackBlur.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.02),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        PredictAirCol(
                          nameOfDay: 'Thứ 2',
                          aqi: 51,
                        ),
                        PredictAirCol(
                          nameOfDay: 'Thứ 3',
                          aqi: 130,
                        ),
                        PredictAirCol(
                          nameOfDay: 'Thứ 4',
                          aqi: 49,
                        ),
                        PredictAirCol(
                          nameOfDay: 'Thứ 5',
                          aqi: 100,
                        ),
                        PredictAirCol(
                          nameOfDay: 'Thứ 6',
                          aqi: 56,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// DateFormat(DateFormat.ABBR_WEEKDAY).format(date);
