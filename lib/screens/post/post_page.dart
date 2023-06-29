import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../widgets/image/error_image.dart';
import '../../widgets/image/rounded_image.dart';
import '../../widgets/image/rounded_rect_image.dart';
import 'post_page_view_model.dart';
import 'widget/post_shimmer.dart';

class PostPage extends GetView<PostPageViewModel> {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.builder((state) {
      return RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: controller.listPost.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(24))),
                child: InkWell(
                  onTap: controller.postAPost,
                  child: Row(
                    children: [
                      const RoundedImage(
                        size: 40,
                        imageURL:
                            'https://firebasestorage.googleapis.com/v0/b/chat-researchteam.appspot.com/o/robin_avt.jpg?alt=media&token=514c4220-a6a3-4ae7-9769-1fdf67a45907&_gl=1*1ax2pqs*_ga*MTIxNjEzMjQ1Mi4xNjgwNDQ0ODE5*_ga_CW55HF8NVT*MTY4NTgxMDM5OS40LjEuMTY4NTgxMDQzMS4wLjAuMA..',
                      ),
                      10.gapWidth,
                      Text(
                        'Check-in địa điểm của bạn!',
                        style: context.textStyle.bodyMedium
                            ?.copyWith(fontSize: 14, color: AppColors.grayText),
                      ),
                      const Spacer(),
                      const Icon(
                        FontAwesomeIcons.solidImage,
                        color: AppColors.darkGreen,
                      ),
                      10.gapWidth
                    ],
                  ),
                ),
              );
            } else {
              if (controller.state == null) {
                return const PostShimmer();
              } else {
                return PostItem(
                  userName: controller.listPost[index - 1]?.userName ?? '',
                  postDate: controller.listPost[index - 1]?.postDate ??
                      DateFormat('MMMMd', 'vi').format(DateTime.now()),
                  location: controller.listPost[index - 1]?.location ??
                      'Da Lat, Lam Dong',
                  imageUrl: controller.listPost[index - 1]?.imagePost ?? '',
                );
              }
            }
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
        ),
      );
    });
  }
}

class PostItem extends StatelessWidget {
  const PostItem(
      {super.key,
      required this.userName,
      required this.postDate,
      required this.imageUrl,
      required this.location});

  final String userName;
  final String postDate;
  final String imageUrl;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    const RoundedImage(
                      size: 40,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/chat-researchteam.appspot.com/o/robin_avt.jpg?alt=media&token=514c4220-a6a3-4ae7-9769-1fdf67a45907&_gl=1*1ax2pqs*_ga*MTIxNjEzMjQ1Mi4xNjgwNDQ0ODE5*_ga_CW55HF8NVT*MTY4NTgxMDM5OS40LjEuMTY4NTgxMDQzMS4wLjAuMA',
                    ),
                    12.gapWidth,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: userName,
                              style: context.textStyle.bodyMedium?.copyWith(
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              children: [
                                TextSpan(
                                    text: ' đã check-in tại một địa điểm mới',
                                    style: context.textStyle.bodyMedium
                                        ?.copyWith(
                                            color: AppColors.grayText,
                                            fontSize: 14)),
                              ],
                            ),
                          ),
                          Text(
                            DateFormat('MMMMd', 'vi')
                                .format(DateTime.parse(postDate)),
                            style: context.textStyle.bodyMedium?.copyWith(
                                fontSize: 14, color: AppColors.grayText),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 15,
                                color: AppColors.grayText,
                              ),
                              5.gapWidth,
                              Text(
                                location,
                                style: context.textStyle.bodyMedium?.copyWith(
                                    fontSize: 14, color: AppColors.grayText),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.grayText,
                    ),
                  ],
                ),
                10.gapHeight,
                Text(
                  'Tôi vừa check-in tại $location.',
                  style: context.textStyle.bodyMedium
                      ?.copyWith(fontSize: 14, color: AppColors.black),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: double.infinity,
            height: 400,
            fit: BoxFit.fitHeight,
            progressIndicatorBuilder: (_, __, DownloadProgress progress) =>
                Center(
                    child: CircularProgressIndicator(value: progress.progress)),
            errorWidget: (_, __, ___) => const ErrorImage(
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
