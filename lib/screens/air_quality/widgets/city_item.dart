import 'package:flutter/material.dart';
import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
    required this.location,
    required this.aqi,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String location;
  final int aqi;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: AppColors.transparentColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.02),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(
                AppImages.imgAirBg,
              ),
              fit: BoxFit.fitWidth,
            )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                location,
                style: context.textStyle.bodyMedium?.copyWith(
                  fontSize: 30,
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
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: '$aqi',
                  style: context.textStyle.bodyMedium?.copyWith(
                    fontSize: 40,
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
            ],
          ),
        ),
      ),
    );
  }
}
