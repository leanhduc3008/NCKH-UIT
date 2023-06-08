import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../widgets/dotted_border/dotted_border.dart';
import '../controller/create_post_controller.dart';

class CreatePost extends GetView<CreatePostController> {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
            onPressed: Get.back,
          ),
          centerTitle: true,
          title: Text(
            'Tạo bài viết',
            style: context.textStyle.bodyMedium?.copyWith(
                fontSize: 20,
                color: AppColors.black,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              onPressed: controller.handleSumit,
              child: Text(
                'Đăng bài',
                style: context.textStyle.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        body: _buildBody(context),
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: controller.getCurrentLocation,
                  child: const Icon(
                    Icons.location_on,
                    size: 30,
                    color: AppColors.darkGreen,
                  ),
                ),
                10.gapWidth,
                Expanded(
                  child: TextField(
                    controller: controller.locationController,
                    style: context.textStyle.bodyMedium
                        ?.copyWith(color: AppColors.black, fontSize: 16),
                    decoration: InputDecoration(
                        hintText: 'Bạn check-in ở đâu?',
                        hintStyle: context.textStyle.bodyMedium
                            ?.copyWith(color: AppColors.grayText, fontSize: 16),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
          10.gapHeight,
          Obx(
            () => controller.imagePost.value == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: controller.handleTakePhoto,
                            child: DottedBorder(
                                color: context.colorScheme.primary,
                                dashPattern: const [8, 8],
                                borderType: BorderType.rRect,
                                radius: const Radius.circular(8),
                                padding: const EdgeInsets.all(6),
                                child: AspectRatio(
                                  aspectRatio: 5 / 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.cameraRetro,
                                        size: 36,
                                      ),
                                      10.gapHeight,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Chụp ảnh từ camera',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.darkGreen),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: controller.handleChooseFromGallery,
                            child: DottedBorder(
                                color: context.colorScheme.primary,
                                dashPattern: const [8, 8],
                                borderType: BorderType.rRect,
                                radius: const Radius.circular(8),
                                padding: const EdgeInsets.all(6),
                                child: AspectRatio(
                                  aspectRatio: 5 / 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.solidImages,
                                        size: 36,
                                      ),
                                      10.gapHeight,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'Chọn ảnh từ thư viện',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: AppColors.darkGreen),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.file(
                      File(controller.imagePost.value!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
