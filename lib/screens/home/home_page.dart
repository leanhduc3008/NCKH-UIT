import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/widget.dart';
import 'home_view_model.dart';

class HomePage extends GetView<HomeViewModel> {
  const HomePage({super.key});

  static const String routePath = '/HomePage';
  static Future<void>? goToPage([bool success = false]) {
    return Get.offAllNamed(HomePage.routePath, arguments: success);
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      drawer: RouteMenu.drawer,
      appBar: AppNavbar.search(
        title: context.l10n.home_page,
        hintText: 'Tìm kiếm địa điểm du lịch',
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.notifications_on_rounded,
                size: 25,
              ),
              onPressed: () {}),
        ],
        bottom: TabBar(
          labelColor: context.colorScheme.onPrimary,
          unselectedLabelColor: context.colorScheme.onPrimary.withOpacity(.5),
          controller: controller.tabController,
          tabs: [
            Tab(
                child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: const Color(0xFFEEEDED).withOpacity(0.2), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.02),
                    offset: const Offset(4, 0),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                'Địa điểm gợi ý',
              ),
            )),
            Tab(
                child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.grayColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: const Color(0xFFEEEDED).withOpacity(0.2), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.02),
                    offset: const Offset(4, 0),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Text(
                'Tất cả bài đăng',
                style: TextStyle(color: AppColors.dark),
              ),
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          _buildBody(context),
          Center(child: Text(context.l10n.feature_in_development)),
        ],
      ),
    floatingActionButton: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
          backgroundColor: AppColors.transparentColor,
          onPressed: () {
            
          },
          child: Image.asset(
            AppImages.iconChat,
            fit: BoxFit.fill,
          )
        ),
    ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Vị trí của bạn',
            style: context.textStyle.titleMedium
                ?.copyWith(color: AppColors.gray63, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(children: [
            const Icon(
              Icons.location_on_rounded,
              color: AppColors.darkGreen,
            ),
            const SizedBox(width: 5),
            Text(
              'Thành phố Hồ Chí Minh',
              style: context.textStyle.titleMedium
                  ?.copyWith(color: AppColors.dark, fontSize: 16),
            ),
          ]),
          const SizedBox(height: 15),
          Text(
            'Địa điểm gợi ý',
            style: context.textStyle.titleMedium
                ?.copyWith(color: AppColors.darkGreen, fontSize: 18),
          ),
          const SizedBox(height: 25),
          Center(
            child: Stack(
              children: [
                Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: AppColors.grayColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.blueShadow,
                          offset: Offset(0, 4),
                          blurRadius: 24,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          AppImages.imageNhaThoDucBa,
                          fit: BoxFit.fill,
                        ))),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          color: AppColors.darkGreen,
                          width: 100,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nhà thờ Đức Bà',
                                style: context.textStyle.titleMedium?.copyWith(
                                    color: AppColors.white, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '01 Công xã Paris, Bến Nghé, Quận 1',
                                  maxLines: 2,
                                  style: context.textStyle.bodyMedium?.copyWith(
                                      color: AppColors.white, fontSize: 14),
                                ),
                              ]),
                            ],
                          ),
                        ))),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
