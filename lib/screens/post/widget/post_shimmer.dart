import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/extension/extenstion.dart';
import '../../../common/constants/theme.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Shimmer.fromColors(
          baseColor: AppColors.bgGray,
          highlightColor: AppColors.white,
          child: Container(
            color: AppColors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black,
                            ),
                          ),
                          12.gapWidth,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  color: AppColors.black,
                                ),
                                Container(
                                  width: 70,
                                  height: 14,
                                  color: AppColors.black,
                                ),
                                Container(
                                  width: 200,
                                  height: 14,
                                  color: AppColors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.gapHeight,
                      Container(
                        width: double.infinity,
                        height: 14,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: AppColors.black,
                )
              ],
            ),
          )),
    );
  }
}
