import 'package:flutter/material.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';

class ProvinceAndCityItem extends StatelessWidget {
  const ProvinceAndCityItem(
      {super.key,
      required this.location,
      required this.iconWeather,
      required this.weather,
      required this.aqi,
      required this.onPressed,
      required this.bgImage});

  final VoidCallback onPressed;
  final String location;
  final String iconWeather;
  final String weather;
  final String bgImage;
  final int aqi;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            color: AppColors.transparentColor,
            image: DecorationImage(
              image: NetworkImage(bgImage),
              fit: BoxFit.fitWidth,
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  35.gapHeight,
                  RichText(
                    text: TextSpan(
                      text: '$aqi',
                      style: context.textStyle.bodyMedium?.copyWith(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4.0,
                            color: AppColors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                      children: [
                        TextSpan(
                            text: ' AQI',
                            style: context.textStyle.bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 4.0,
                                  color: AppColors.black.withOpacity(0.25),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Text(
                    location,
                    style: context.textStyle.bodyMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
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
            ),
            const Spacer(),
            Column(
              children: [
                Image.asset(
                  iconWeather,
                  width: 120,
                  height: 120,
                ),
                const Spacer(),
                Text(
                  weather,
                  style: context.textStyle.bodyMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0, 4),
                        blurRadius: 4.0,
                        color: AppColors.black.withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
                20.gapHeight
              ],
            )
          ],
        ),
      ),
    );
  }
}
