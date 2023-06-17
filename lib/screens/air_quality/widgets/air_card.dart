import 'package:flutter/material.dart';

import '../../../common/constants/theme.dart';

class AirCard extends StatelessWidget {
  const AirCard({super.key, required this.title, required this.aqi});

  final String title;

  final int aqi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFF63C9C9),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.02),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ]),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '$aqi',
            style: const TextStyle(
              fontSize: 22,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
