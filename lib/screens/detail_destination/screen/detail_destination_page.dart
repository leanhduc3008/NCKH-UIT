import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/appbar/app_navbar.dart';
import '../../../widgets/image/rounded_rect_image.dart';
import 'detail_destination_viewmodel.dart';

class DetailDestinationPage extends GetView<DetailDestinationViewModel> {
  const DetailDestinationPage({super.key});

  static const String routePath = '/DetailDestinationPage';
  static Future<void>? goToPage() {
    return Get.offAllNamed(DetailDestinationPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
        builder: (_) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppNavbar(
                elevation: 0,
                backgroundColor: AppColors.transparentColor,
                leading: InkWell(
                  onTap: Get.back,
                  child: Container(
                      margin: const EdgeInsets.only(left: Dimens.s4),
                      height: 31,
                      width: 31,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grayButton,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 15,
                        color: AppColors.darkGreen,
                      )),
                ),
                actions: [
                  SimpleBuilder(
                    builder: (_) => InkWell(
                      onTap: () {
                        controller.isFavourite = !controller.isFavourite;
                        controller.onRefresh();
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          height: 37,
                          width: 37,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayButton,
                          ),
                          child: controller.isFavourite
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  size: 15,
                                  color: AppColors.darkGreen,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 15,
                                  color: AppColors.darkGreen,
                                )),
                    ),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 6 / 10,
                      child: RoundedRectImage(
                        imageURL: controller.state?.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 6 / 10,
                        padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: 32.radius, topRight: 32.radius)),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          controller.state?.name ?? '',
                                          style: context.textStyle.titleLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black),
                                        ),
                                      ),
                                      5.gapHeight,
                                      Row(children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          color: AppColors.darkGreen,
                                        ),
                                        5.gapWidth,
                                        Text(
                                          controller.state?.location ?? '',
                                          style: context.textStyle.bodyMedium
                                              ?.copyWith(
                                                  color: AppColors.grayColor,
                                                  fontSize: 16),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.bgLogin,
                                      borderRadius: BorderRadius.all(11.radius),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite,
                                          color: AppColors.darkGreen,
                                        ),
                                        3.gapWidth,
                                        Text(
                                          '${controller.state?.favouriteNumber} lượt',
                                          style: context.textStyle.titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              5.gapHeight,
                              Text(
                                'Đánh giá',
                                style: context.textStyle.titleMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkGreen),
                              ),
                              10.gapHeight,
                              Row(
                                children: [
                                  Image.asset(AppImages.imgStarReview),
                                  5.gapWidth,
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tổng đánh giá',
                                        style: context.textStyle.bodyMedium
                                            ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.gray89),
                                      ),
                                      Text(
                                        '${controller.state?.pointReview}/5',
                                        style: context.textStyle.bodyMedium
                                            ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 40,
                                    width: 50,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.darkGreen,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.darkGreen
                                              .withOpacity(0.4),
                                          offset: const Offset(0, 4),
                                          blurRadius: 15,
                                        ),
                                      ],
                                    ),
                                    child: FittedBox(
                                      child: IconButton(
                                          icon: const Icon(
                                            Icons.map_rounded,
                                            color: AppColors.white,
                                            size: 150,
                                          ),
                                          onPressed: controller.getToMap),
                                    ),
                                  )
                                ],
                              ),
                              25.gapHeight,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.darkGreen,
                                    borderRadius: BorderRadius.all(7.radius),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(4, 3),
                                          color: AppColors.darkGreen
                                              .withOpacity(0.96),
                                          blurRadius: 9)
                                    ]),
                                child: Text(
                                  'Mô tả',
                                  style: context.textStyle.bodyMedium?.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                ),
                              ),
                              15.gapHeight,
                              Text(
                                controller.state?.detail ?? '',
                                style: context.textStyle.bodyMedium?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.gray89),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ));
  }
}
