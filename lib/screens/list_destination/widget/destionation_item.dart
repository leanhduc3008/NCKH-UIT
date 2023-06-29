import 'package:flutter/material.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/image/rounded_rect_image.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.location,
      required this.iconWeather,
      required this.weather,
      required this.aqi,
      required this.onPressed});

  final VoidCallback onPressed;
  final String imageUrl;
  final String name;
  final String location;
  final String iconWeather;
  final String weather;
  final int aqi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26.0),
        border: Border.all(color: AppColors.white, width: 0.62),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 33,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.transparentColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.bgCardShadow,
                    offset: Offset(-1, 6),
                    blurRadius: 15)
              ],
            ),
            width: 180,
            height: 140,
            child: RoundedRectImage(
              borderRadius: BorderRadius.circular(10),
              imageURL: imageUrl,
            ),
          ),
          15.gapWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: context.textStyle.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                Row(children: [
                  Image.asset(
                    AppImages.icAqi,
                    width: 40,
                    height: 40,
                    color: AppColors.darkGreen,
                  ),
                  5.gapWidth,
                  Text(
                    'AQI $aqi',
                    style: context.textStyle.bodyMedium
                        ?.copyWith(color: AppColors.darkGreen, fontSize: 14),
                  ),
                ]),
                Row(children: [
                  Image.asset(
                    iconWeather,
                    width: 40,
                    height: 40,
                  ),
                  5.gapWidth,
                  Text(
                    weather,
                    style: context.textStyle.bodyMedium
                        ?.copyWith(color: AppColors.grayColor, fontSize: 14),
                  ),
                ]),
                3.gapHeight,
                Row(children: [
                  9.gapWidth,
                  const Icon(
                    Icons.location_on_rounded,
                    color: AppColors.darkGreen,
                  ),
                  13.gapWidth,
                  Text(
                    location,
                    style: context.textStyle.bodyMedium
                        ?.copyWith(color: AppColors.grayColor, fontSize: 14),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
