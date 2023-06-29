import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/theme.dart';
import '../../../widgets/progress/shimmer_progress.dart';
import '../controller/city_lists_controller.dart';
import '../model/weather.dart';

class CityLists extends GetView<CityListsController> {
  const CityLists({super.key});

  static const String routePath = '/CityListPage';

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      if (controller.state == null || controller.status.isLoading) {
        return const Center(
          child: Scaffold(body: LogoProgress()),
        );
      }
      if (controller.status.isSuccess) {
        return Scaffold(
          backgroundColor: AppColors.white,
          extendBodyBehindAppBar: true,
          appBar: _buildAppBar(),
          body: _buildBody(),
        );
      }
      return Container();
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      titleSpacing: 0,
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Text(
          'Danh sách thành phố',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
          size: 20,
        ),
        onPressed: Get.back,
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0083b0).withOpacity(1),
          const Color(0xFF008CB8).withOpacity(1),
          const Color(0xFF00b4db).withOpacity(1),
        ],
      )),
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: controller.state?.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (DismissDirection direction) {
                controller.deleteCity(
                    controller.state!.elementAt(index).location.name);
                controller.state!.removeAt(index);
              },
              key: ValueKey<Weather>(controller.state!.elementAt(index)),
              child: _buildItems(controller.state!.elementAt(index)),
            );
          }),
    );
  }

  GestureDetector _buildItems(Weather weather) {
    return GestureDetector(
      onTap: () {
        Get.back(result: weather.location.name);
      },
      child: Container(
          width: 359,
          margin: const EdgeInsets.fromLTRB(15, 38, 15, 15),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: const Color(0xFFEEEDED).withOpacity(0.2), width: 2),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFFFFFF).withOpacity(0.4),
                  const Color(0xFFFFFFFF).withOpacity(0.0)
                ]),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFFFFF).withOpacity(0.02),
                offset: const Offset(-5, -5),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    weather.location.name,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    '${weather.current.temp}' '\u02DA',
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  DateFormat('HH:mm').format(DateFormat('yyyy-MM-dd HH:mm')
                      .parse(weather.location.localTime)),
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.63)),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      weather.current.condition.text,
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 18, color: Colors.white.withOpacity(0.63)),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Max. ${(weather.forecast.forecastdays.first.day.maxTemp).toInt()}\u02DA Min. ${(weather.forecast.forecastdays.first.day.minTemp).toInt()}\u02DA',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white.withOpacity(0.63)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
