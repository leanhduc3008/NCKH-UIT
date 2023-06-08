import 'package:flutter/material.dart';

import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';

class PredictAirCol extends StatelessWidget {
  const PredictAirCol({super.key, required this.nameOfDay, required this.aqi});

  final String nameOfDay;

  final double aqi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nameOfDay,
          style: context.textStyle.bodyMedium?.copyWith(color: AppColors.white),
        ),
        10.gapHeight,
        Image.asset(
          (aqi >= 0 && aqi <= 50)
              ? AppImages.imgGoodAir
              : (aqi > 50 && aqi <= 100)
                  ? AppImages.imgModerateAir
                  : AppImages.imgQuiteUnhealthyAir,
          height: 40,
          width: 40,
        ),
        5.gapHeight,
        Text(
          '$aqi',
          style: context.textStyle.bodyMedium?.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
