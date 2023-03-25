import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';
import '../../router/route_menu.dart';
import 'city/city_lists.dart';
import 'controller/city_lists_controller.dart';
import 'model/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});
  static const String routePath = '/WeatherPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(WeatherPage.routePath);
  }

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final CityListsController _cityListsController = CityListsController();
  Weather? weather;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
        future: name == ''
            ? _cityListsController.loadCity('Ho Chi Minh City')
            : _cityListsController.loadCity(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            weather = snapshot.data;
            return Scaffold(
                extendBodyBehindAppBar: true,
                drawer: RouteMenu.drawer,
                appBar: _buildAppBar(),
                body: _buildBody());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Container();
          }
        });
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: AppColors.transparentColor,
      title: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              weather?.location.name ?? '',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              DateFormat.yMMMMd('en_US').format(DateFormat('yyyy-MM-dd ')
                  .parse(weather?.location.localTime ?? '')),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18, color: Colors.white.withOpacity(0.63)),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.apps,
              size: 35,
            ),
            onPressed: () async {
              name = await Get.to(() => const CityLists()) ?? 'Ho Chi Minh';
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 130, 0, 10),
        // width: double.infinity,
        // height: double.infinity,
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
        child: Column(
          children: [
            Image.asset(
              AppImages.imageWeather,
              width: 140,
              height: 110,
            ),
            Text(
              '${weather?.current.temp}' '\u02DA',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            Text(
              weather?.current.condition.text ?? '',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 360) / 2,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    width: 160,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: const Color(0xFFEEEDED).withOpacity(0.2),
                          width: 2),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFFFFFFF).withOpacity(0.5),
                            const Color(0xFFEEEDED).withOpacity(0.1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFFFFF).withOpacity(0.02),
                          offset: const Offset(-5, -5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Text(
                              'MIN TEMP',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.49)),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              '${(weather?.forecast.forecastdays.first.day.minTemp ?? 0).toInt()}'
                              '\u02DA',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                              child: Text(
                            'Min',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                        ],
                      ),
                    ])),
                const Spacer(),
                Container(
                    width: 160,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: const Color(0xFFEEEDED).withOpacity(0.2),
                          width: 2),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFFFFFFF).withOpacity(0.5),
                            const Color(0xFFEEEDED).withOpacity(0.1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFFFFF).withOpacity(0.02),
                          offset: const Offset(-5, -5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Text(
                              'MAX TEMP',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.49)),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              '${(weather?.forecast.forecastdays.first.day.maxTemp ?? 0).toInt()}'
                              '\u02DA',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                              child: Text(
                            'Max',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )),
                        ],
                      ),
                    ])),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 360) / 2,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 360) / 2,
                ),
                Container(
                    width: 160,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: const Color(0xFFEEEDED).withOpacity(0.2),
                          width: 2),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFFFFFFF).withOpacity(0.5),
                            const Color(0xFFEEEDED).withOpacity(0.1)
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFFFFFF).withOpacity(0.02),
                          offset: const Offset(-5, -5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      _getUvWidget(),
                    ])),
                const Spacer(),
                SizedBox(
                  height: 180,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: 160,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: const Color(0xFFEEEDED).withOpacity(0.2),
                                width: 2),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFFFFFFF).withOpacity(0.5),
                                  const Color(0xFFEEEDED).withOpacity(0.1)
                                ]),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFFFFFFFF).withOpacity(0.02),
                                offset: const Offset(-5, -5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    'FEELS LIKE',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.49)),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    '${(weather?.current.feelsLike ?? 0).toInt()}'
                                    '\u02DA',
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                      const Spacer(),
                      Container(
                          width: 160,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: const Color(0xFFEEEDED).withOpacity(0.2),
                                width: 2),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFFFFFFF).withOpacity(0.4),
                                  const Color(0xFFEEEDED).withOpacity(0.1)
                                ]),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFFFFFFF).withOpacity(0.1),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Text(
                                    'PRESSURE',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.49)),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    '${(weather?.current.pressure ?? 0).toInt()}'
                                    ' hPa',
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 360) / 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getUvWidget() {
    if (((weather?.current.uv ?? 0) >= 0.0) &&
        ((weather?.current.uv ?? 0) <= 2.0)) {
      return const Text(
        'Low',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 30, color: Colors.white),
      );
    } else if (((weather?.current.uv ?? 0) >= 3.0) &&
        ((weather?.current.uv ?? 0) <= 5.0)) {
      return const Text(
        'Moderate',
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 30, color: Colors.white),
      );
    }
    return const Text(
      'High',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 30, color: Colors.white),
    );
  }

  Widget _getUvWidget() {
    if (((weather?.current.uv ?? 0) >= 0.0) &&
        ((weather?.current.uv ?? 0) <= 2.0)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              'Uv Indicator',
              style: TextStyle(
                  fontSize: 15, color: Colors.white.withOpacity(0.49)),
            ),
          ),
          SizedBox(
            child: Text(
              '${(weather?.current.uv ?? 0).toInt()}',
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          const SizedBox(
              child: Text(
            'Low',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            child: Text(
              'Low level during \nall the day',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      );
    } else if (((weather?.current.uv ?? 0) >= 3.0) &&
        ((weather?.current.uv ?? 0) <= 5.0)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text(
              'Uv Indicator',
              style: TextStyle(
                  fontSize: 15, color: Colors.white.withOpacity(0.49)),
            ),
          ),
          SizedBox(
            child: Text(
              '${(weather?.current.uv ?? 0).toInt()}',
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          const SizedBox(
              child: Text(
            'Moderate',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            child: Text(
              'Moderate level \nduring all the day',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            'Uv Indicator',
            style:
                TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.49)),
          ),
        ),
        SizedBox(
          child: Text(
            '${(weather?.current.uv ?? 0).toInt()}',
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        const SizedBox(
            child: Text(
          'High',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 30, color: Colors.white),
        )),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          child: Text(
            'High level during \nall the day',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
