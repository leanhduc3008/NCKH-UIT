import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../controller/create_post_controller.dart';
import '../controller/test_controller.dart';

class PostTest extends GetView<TestController> {
  const PostTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
        builder: (_) => controller.imagePost == null
            ? Center(
                child: TextButton(
                onPressed: controller.handleChooseFromGallery,
                child: Text(
                  'Ảnh nè',
                  style: context.textStyle.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.darkGreen,
                      fontWeight: FontWeight.w500),
                ),
              ))
            : SimpleBuilder(
                builder: (_) => SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.file(
                        File(controller.imagePost!.path),
                        fit: BoxFit.cover,
                      ),
                    )));
  }
}
