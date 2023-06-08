import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../common/constants/dimens.dart';
import '../../../../common/constants/theme.dart';
import '../../../../widgets/appbar/app_navbar.dart';
import 'google_map_view_model.dart';

class GoogleMapPage extends GetView<GoogleMapViewModel> {
  const GoogleMapPage({super.key});

  static const String routePath = '/GoogleMap';
  static Future<void>? goToPage() {
    return Get.offAllNamed(GoogleMapPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      if (controller.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final LatLng destination =
          LatLng(controller.state!.latitude, controller.state!.longtitude);
      controller.setCustomMarkerIcon();
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppNavbar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          leading: InkWell(
            onTap: Get.back,
            child: Container(
                margin: const EdgeInsets.only(left: Dimens.s4),
                height: 31,
                width: 31,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grayButton,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 15,
                  color: AppColors.darkGreen,
                )),
          ),
        ),
        backgroundColor: AppColors.borderTextFormField,
        body: GoogleMap(
          initialCameraPosition: CameraPosition(target: destination, zoom: 14),
          markers: {
            Marker(
                markerId: MarkerId(controller.state!.name),
                icon: controller.destinationIcon,
                position: destination,
                infoWindow: InfoWindow(title: controller.state!.name)),
          },
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          onMapCreated: (GoogleMapController googleController) {
            controller.gmController.complete(googleController);
          },
        ),
      );
    });
  }
}
