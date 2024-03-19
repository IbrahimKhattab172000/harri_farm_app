// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class SelectLocationPickLocation extends StatefulWidget {
  const SelectLocationPickLocation({super.key});

  @override
  State<SelectLocationPickLocation> createState() =>
      _SelectLocationPickLocationState();
}

class _SelectLocationPickLocationState
    extends State<SelectLocationPickLocation> {
  late CameraPosition initialCameraPosition;
  late LatLng selectedLocation;
  BitmapDescriptor? markerIcon;

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
          onTap: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppAppBar(
        title: "pick_up_location".tr(),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onTap: (LatLng latLng) {
          setState(() {
            selectedLocation = latLng;
          });
          print('Selected Location: $selectedLocation');
        },
        markers: {
          Marker(
            markerId: const MarkerId(
              'selectedLocation',
            ),
            position: selectedLocation,
          ),
        },
      ),
    );
  }
}
