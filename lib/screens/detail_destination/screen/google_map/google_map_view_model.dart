import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../common/base/base_view_model.dart';
import '../../../../data/model/destination.dart';

class GoogleMapViewModel extends BaseViewModel<Destination> {
  final Completer<GoogleMapController> gmController = Completer();
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  LocationData? currentLocation;

  @override
  Future<Destination?> initialData() async {
    return Get.arguments;
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/ic_travel_app.png')
        .then((icon) => destinationIcon = icon);
  }

}
