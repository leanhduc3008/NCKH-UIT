import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/progress/shimmer_progress.dart';
import '../controller/city_lists_controller.dart';
import '../model/weather.dart';

class CityLists extends GetView<CityListsController> {
  const CityLists({super.key});

  // int i = 0;
  // List<String> pool = [
  //   'Ho Chi Minh City',
  //   'Ha Noi',
  //   'Da Nang',
  //   'Da Lat',
  //   'Vung Tau',
  //   'Nha Trang',
  //   'Binh Duong'
  // ];

  // Future<void> _loadAddedCity() async {
  //   if (pool == []) {
  //     return;
  //   }
  //   for (final item in _cityListsController.cityLists) {
  //     if (pool[i] == item) {
  //       pool.removeAt(i);
  //       await _loadAddedCity();
  //     }
  //   }
  //   _cityListsController.addCity(pool[i]);
  //   pool.removeAt(i);
  //   await _cityListsController.loadCityLists();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingButton());
  }

  Container _buildFloatingButton() {
    return Container(
      width: 75,
      height: 75,
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
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
      child: FloatingActionButton(
        onPressed: () {
          // _loadAddedCity();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        focusElevation: 0,
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Text(
          'City List',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SimpleBuilder(builder: (context) {
      if (controller.state == null || controller.status.isLoading) {
        return const Center(
          child: LogoProgress(
            size: 300,
          ),
        );
      }
      if (controller.status.isSuccess) {
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
      return Container();
    });
  }

  GestureDetector _buildItems(Weather weather) {
    return GestureDetector(
      onTap: () {
        Get.back(result: weather.location.name);
      },
      child: Container(
          width: 359,
          height: 131,
          margin: const EdgeInsets.fromLTRB(15, 38, 15, 0),
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
                  Text(
                    weather.current.condition.text,
                    style: TextStyle(
                        fontSize: 20, color: Colors.white.withOpacity(0.63)),
                  ),
                  const Spacer(),
                  Text(
                    'Max. ${(weather.forecast.forecastdays.first.day.maxTemp).toInt()}\u02DA Min. ${(weather.forecast.forecastdays.first.day.minTemp).toInt()}\u02DA',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white.withOpacity(0.63)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
