import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/constants/images.dart';
import '../../common/constants/theme.dart';

class DownloadProgress extends StatelessWidget {
  const DownloadProgress({super.key, this.size = 50});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.bgGray,
        highlightColor: AppColors.white,
        child: Icon(Icons.downloading, size: size));
  }
}

class LogoProgress extends StatelessWidget {
  const LogoProgress({super.key, this.size = 300, this.logo});

  final double size;

  final String? logo;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.bgGray,
        highlightColor: AppColors.blueText,
        child: Center(
          child: Image.asset(
            logo ?? AppImages.imgSunCloud,
            width: size,
            height: size,
            fit: BoxFit.contain,
          ),
        ));
  }
}
