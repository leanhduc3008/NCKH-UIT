import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/theme.dart';
import '../../../common/extension/extenstion.dart';
import '../../../data/model/destination.dart';
import '../../../widgets/image/rounded_rect_image.dart';
import '../controller/destination_controller.dart';

class ListDestinationCard extends GetView<DestinationController> {
  const ListDestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.builder((state) {
      final listDestination = controller.state!;
      return ListView.separated(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: listDestination.length,
        itemBuilder: (context, index) => DestinationCard(
          destination: listDestination[index],
          onPressed: () => controller.getToDetailPage(listDestination[index]),
        ),
        separatorBuilder: (BuildContext context, int index) => Container(
          color: AppColors.transparentColor,
          width: 20,
        ),
      );
    });
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard(
      {super.key, required this.destination, required this.onPressed});

  final VoidCallback onPressed;
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 270,
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
      child: Column(
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
            width: double.infinity,
            height: 160,
            child: RoundedRectImage(
              imageURL: destination.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          10.gapHeight,
          Text(
            destination.name,
            style: context.textStyle.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          5.gapHeight,
          Row(children: [
            const Icon(
              Icons.location_on_rounded,
              color: AppColors.darkGreen,
            ),
            5.gapWidth,
            Text(
              destination.location,
              style: context.textStyle.bodyMedium
                  ?.copyWith(color: AppColors.grayColor, fontSize: 16),
            ),
            const Spacer(),
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGreen.withOpacity(0.4),
                    offset: const Offset(0, 4),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: FittedBox(
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.white,
                      size: 80,
                    ),
                    onPressed: onPressed),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
