import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/progress/shimmer_progress.dart';
import '../controller/predict_air_controller.dart';

class ListPredictAir extends GetView<PredictAirController> {
  const ListPredictAir({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return controller.builder((state) {
      return Column(
        children: [
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Obx(() => InkWell(
                      onTap: () {
                        controller.isDeepQLearning.value = true;
                        controller.isLSTM.value = false;
                        controller.isRNN.value = false;
                        controller.isGRU.value = false;
                        controller.getDeepQLPredict(cityName);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: controller.isDeepQLearning.value
                                ? const Color(0xFF43CCCC)
                                : AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                                color: AppColors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                offset: const Offset(5, 4),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Text(
                          'Deep Q-L',
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium?.copyWith(
                              color: controller.isDeepQLearning.value
                                  ? AppColors.white
                                  : const Color(0xFF43CCCC),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                10.gapWidth,
                Obx(() => InkWell(
                      onTap: () {
                        controller.isDeepQLearning.value = false;
                        controller.isLSTM.value = true;
                        controller.isRNN.value = false;
                        controller.isGRU.value = false;
                        controller.getLSTMPredict(cityName);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: controller.isLSTM.value
                                ? const Color(0xFF43CCCC)
                                : AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                                color: AppColors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                offset: const Offset(5, 4),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Text(
                          'LSTM',
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium?.copyWith(
                              color: controller.isLSTM.value
                                  ? AppColors.white
                                  : const Color(0xFF43CCCC),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                10.gapWidth,
                Obx(() => InkWell(
                      onTap: () {
                        controller.isDeepQLearning.value = false;
                        controller.isLSTM.value = false;
                        controller.isRNN.value = true;
                        controller.isGRU.value = false;
                        controller.getRNNPredict(cityName);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: controller.isRNN.value
                                ? const Color(0xFF43CCCC)
                                : AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                                color: AppColors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                offset: const Offset(5, 4),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Text(
                          'RNN',
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium?.copyWith(
                              color: controller.isRNN.value
                                  ? AppColors.white
                                  : const Color(0xFF43CCCC),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                10.gapWidth,
                Obx(() => InkWell(
                      onTap: () {
                        controller.isDeepQLearning.value = false;
                        controller.isLSTM.value = false;
                        controller.isRNN.value = false;
                        controller.isGRU.value = true;
                        controller.getGRUPredict(cityName);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: controller.isGRU.value
                                ? const Color(0xFF43CCCC)
                                : AppColors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                                color: AppColors.white.withOpacity(0.2)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.25),
                                offset: const Offset(5, 4),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Text(
                          'GRU',
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium?.copyWith(
                              color: controller.isGRU.value
                                  ? AppColors.white
                                  : const Color(0xFF43CCCC),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          20.gapHeight,
          Obx(() => controller.isLoading.value
              ? const LogoProgress(
                  size: 100,
                  logo: AppImages.imgAirShimmer,
                )
              : Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF63C9C9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                  color: AppColors.white.withOpacity(0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.25),
                                  offset: const Offset(5, 4),
                                  blurRadius: 10,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('E').format(
                                    DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                                        controller.lstPredict[index].Date)),
                                style: context.textStyle.bodyMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                              10.gapHeight,
                              Image.asset(
                                (controller.lstPredict[index].AQI <= 50)
                                    ? AppImages.imgGoodAir
                                    : (controller.lstPredict[index].AQI > 50) &&
                                            (controller.lstPredict[index].AQI <=
                                                100)
                                        ? AppImages.imgModerateAir
                                        : (controller.lstPredict[index].AQI >
                                                    100) &&
                                                (controller.lstPredict[index]
                                                        .AQI <=
                                                    150)
                                            ? AppImages.imgQuiteUnhealthyAir
                                            : (controller.lstPredict[index]
                                                            .AQI >
                                                        150) &&
                                                    (controller
                                                            .lstPredict[index]
                                                            .AQI <=
                                                        200)
                                                ? AppImages.imgBadAir
                                                : (controller.lstPredict[index]
                                                                .AQI >
                                                            200) &&
                                                        (controller
                                                                .lstPredict[
                                                                    index]
                                                                .AQI <=
                                                            300)
                                                    ? AppImages
                                                        .imgExtremelyUnhealthy
                                                    : AppImages.imgDangerous,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                              5.gapHeight,
                              Text(
                                '${controller.lstPredict[index].AQI}',
                                style: context.textStyle.bodyMedium
                                    ?.copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            width: 10,
                          ),
                      itemCount: controller.lstPredict.length),
                )),
        ],
      );
    });
  }
}
