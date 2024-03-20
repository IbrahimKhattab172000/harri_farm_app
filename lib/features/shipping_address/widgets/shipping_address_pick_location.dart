import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ShippingAddressPickLocation extends StatefulWidget {
  final void Function(LatLng) onSelectLocation;

  const ShippingAddressPickLocation({Key? key, required this.onSelectLocation})
      : super(key: key);

  @override
  State<ShippingAddressPickLocation> createState() =>
      _ShippingAddressPickLocationState();
}

class _ShippingAddressPickLocationState
    extends State<ShippingAddressPickLocation> {
  late CameraPosition initialCameraPosition;
  late LatLng selectedLocation;
  BitmapDescriptor? markerIcon;
  String placeName = '';

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.056458878848574, 31.366789128616503),
      zoom: 10,
    );
    selectedLocation = initialCameraPosition.target;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: AppButton(
          title: "next".tr(),
          onTap: () {
            RouteUtils.pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppAppBar(
        title: "pick_up_location".tr(),
        elevation: 0,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onTap: (LatLng latLng) async {
          setState(() {
            selectedLocation = latLng;
          });
          log('Selected Location: $selectedLocation');
          widget.onSelectLocation(selectedLocation);
        },
        markers: {
          Marker(
            markerId: const MarkerId('selectedLocation'),
            position: selectedLocation,
          ),
        },
      ),
    );
  }
}
