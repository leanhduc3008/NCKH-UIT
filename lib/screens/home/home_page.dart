import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/button/elevated_button.dart';
import '../../widgets/image/rounded_rect_image.dart';
import '../post/post_page.dart';
import 'home_view_model.dart';
import 'widget/destination_card.dart';
import 'widget/home_search_widget.dart';

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
      backgroundColor: AppColors.white,
      drawer: RouteMenu.drawer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        title: Text(context.l10n.home_page),
        centerTitle: false,
        titleSpacing: Dimens.s2,
        titleTextStyle:
            context.textStyle.titleMedium?.copyWith(color: AppColors.black),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: Dimens.s4),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkGreen.withOpacity(0.4),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: IconButton(
                icon: const Icon(
                  Icons.notifications_on_rounded,
                  color: AppColors.white,
                  size: 20,
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelColor: AppColors.black,
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              labelStyle: context.textStyle.bodyMedium
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
              unselectedLabelColor: Colors.grey,
              controller: controller.tabController,
              indicator: CircleTabIndicator(color: AppColors.black, radius: 3),
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: const [
                Tab(
                  child: Text(
                    'Địa điểm gợi ý',
                  ),
                ),
                Tab(
                  child: Text(
                    'Tất cả bài đăng',
                  ),
                ),
              ],
            ),
          ),
          10.gapHeight,
          Expanded(
            child: TabBarView(controller: controller.tabController, children: [
              _buildBody(context),
              Container(color: AppColors.grayButton, child: const PostPage()),
            ]),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.fromLTRB(10, 0, 0, 70),
      //   child: FloatingActionButton(
      //       backgroundColor: AppColors.transparentColor,
      //       onPressed: controller.getToChat,
      //       child: Image.asset(
      //         AppImages.iconChat,
      //         fit: BoxFit.fill,
      //       )),
      // ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final width = 32 + MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width / 2;
    return SimpleBuilder(builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              AppImages.imgHomeTitle,
              width: 300,
              height: 100,
            ),
            20.gapHeight,
            Row(
              children: [
                const Expanded(
                  flex: 9,
                  child: HomeSearchWidget(
                    hintText: 'Tìm kiếm địa điểm',
                  ),
                ),
                10.gapWidth,
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: AppColors.darkGreen,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGreen.withOpacity(0.4),
                          offset: const Offset(0, 4),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: IconButton(
                        icon: const Icon(
                          Icons.tune_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                        onPressed: () {}),
                  ),
                )
              ],
            ),
            20.gapHeight,
            Text(
              'Địa điểm nổi bật',
              style: context.textStyle.titleMedium
                  ?.copyWith(color: AppColors.black, fontSize: 18),
            ),
            15.gapHeight,
            SimpleBuilder(builder: (context) {
              if (controller.status.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CarouselSlider(
                carouselController: controller.controller,
                options: CarouselOptions(
                  height: 500,
                  initialPage: controller.current,
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: width / height,
                  onPageChanged: (index, reason) {
                    controller.current = index;
                  },
                ),
                items: controller.listDestination
                    .map<Widget>((listDestination) => Stack(children: [
                          SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: RoundedRectImage(
                              imageURL: controller
                                      .listDestination[controller.current]
                                      ?.imageUrl ??
                                  '',
                              borderRadius: 12.borderRadius,
                            ),
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: const Offset(0, 4),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Đà Lạt',
                                      style: context.textStyle.bodyMedium
                                          ?.copyWith(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white),
                                    ),
                                    5.gapHeight,
                                    Row(children: [
                                      const Icon(
                                        Icons.location_on_rounded,
                                        color: AppColors.darkGreen,
                                      ),
                                      5.gapWidth,
                                      Text(
                                        'Lâm Đồng',
                                        style: context.textStyle.titleMedium
                                            ?.copyWith(
                                                color: AppColors.white,
                                                fontSize: 16),
                                      ),
                                    ]),
                                    10.gapHeight,
                                    AppElevatedButton(
                                      expandedWith: false,
                                      onPressed: () {},
                                      backgroundColor: AppColors.darkGreen,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          'Xem chi tiết',
                                          style: context.textStyle.bodyMedium
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ]))
                    .toList(),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.banner.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => controller.controller.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    width: controller.current == entry.key ? 24 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: 20.borderRadius,
                        color: AppColors.darkGreen.withOpacity(
                            controller.current == entry.key ? 1 : .5)),
                  ),
                );
              }).toList(),
            ),
            20.gapHeight,
            Row(
              children: [
                Text(
                  'Địa điểm gợi ý',
                  style: context.textStyle.titleMedium
                      ?.copyWith(color: AppColors.dark, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  'Xem tất cả',
                  style: context.textStyle.bodyMedium?.copyWith(
                      color: AppColors.darkGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            25.gapHeight,
            const SizedBox(height: 270, child: ListDestinationCard())
          ]),
        ),
      );
    });
  }
}

class CircleTabIndicator extends Decoration {
  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);
  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;
  final Paint _paint;
  final double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
