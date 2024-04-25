import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/add_address/bloc/add_address_bloc.dart';
import 'package:harri_farm_app/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:harri_farm_app/features/add_address/models/cities_and_address.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/helpers/validator.dart';
import 'package:harri_farm_app/widgets/app_drop_down_menu.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class AddAddressForms extends StatefulWidget {
  final CitiesAndRegionsModel citiesData, regionData;
  const AddAddressForms({
    super.key,
    required this.citiesData,
    required this.regionData,
  });

  @override
  State<AddAddressForms> createState() => _ShippingAddressFieldsState();
}

class _ShippingAddressFieldsState extends State<AddAddressForms> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    //  List<CitiesAndRegionsData> reg  =  widget.regionData.data ?? ;
    List<SelectionItem> cities = widget.citiesData.data
            ?.map((e) => SelectionItem(
                  label: e.name.toString(),
                  value: e.id,
                ))
            .toList() ??
        [];

    List<SelectionItem> region = widget.regionData.data
            ?.map((e) => SelectionItem(
                  label: e.name.toString(),
                  value: e.id,
                ))
            .toList() ??
        [];

    return BlocBuilder<CitiesAndRegionsBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final bloc = AddAddressBloc.of(context);

          return Form(
            key: bloc.addAddresKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  label: "name".tr(),
                  controller: bloc.nameController,
                  validator: Validator.name,
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "phone_number".tr(),
                  controller: bloc.phoneController,
                  validator: Validator.phone,
                ),
                // SizedBox(height: 8.height),
                // AppTextField(label: "additional_phone_number".tr()),
                SizedBox(height: 8.height),

                AppTextField(
                  label: "adding_address".tr(),
                  controller: bloc.addressDetailsController,
                  validator: Validator.empty,
                ),

                SizedBox(height: 12.height),

                AppText(
                  title: "city".tr(),
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 8.height),
                AppDropDownSelection.single(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  initialItem: null,
                  items: cities,
                  onChangeSingle: (value) {
                    CitiesAndRegionsBloc.of(context)
                        .add(Read(arguments: value?.value.toString() ?? "0"));

                    bloc.cityId = value?.value.toString() ?? "0";
                  },
                  hint: "",
                ),
                SizedBox(height: 12.height),
                region.isEmpty
                    ? const SizedBox()
                    : Column(
                        children: [
                          AppText(
                            title: "area".tr(),
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 8.height),
                        ],
                      ),

                AppDropDownSelection.single(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  initialItem: null,
                  items: region,
                  onChangeSingle: (value) {
                    bloc.countryId = value?.value.toString() ?? "0";
                  },
                  hint: "",
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "neighborhood".tr(),
                  controller: bloc.neighborhoodController,
                  validator: Validator.empty,
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "st_name".tr(),
                  controller: bloc.streetNameController,
                  validator: Validator.empty,
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "residential_number".tr(),
                  controller: bloc.buildingNumberController,
                  validator: Validator.empty,
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "notes".tr(),
                  controller: bloc.notesController,
                  validator: Validator.empty,
                ),
                SizedBox(height: 8.height),
                AppTextField(
                  label: "pick_location_on_map".tr(),
                  validator: Validator.empty,
                  controller: TextEditingController(
                      text: selectedLocation != null
                          ? "${selectedLocation!.latitude}, ${selectedLocation!.longitude}"
                          : ""),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacePicker(
                          //Just change the apikey in the utils and the manifest with another one that i authorized to use this functionality.
                          apiKey: Utils.mapAPIKey,
                          onPlacePicked: (result) {
                            log(result.formattedAddress ?? "null");
                            Navigator.of(context).pop();
                          },
                          initialPosition: const LatLng(
                              31.056458878848574, 31.366789128616503),
                          useCurrentLocation: true,
                          resizeToAvoidBottomInset: false,
                        ),
                      ),
                    );
                    //Old way of picking
                    // RouteUtils.navigateTo(
                    //   ShippingAddressPickLocation(
                    //     onSelectLocation: (location) {
                    //       setState(() {
                    //         selectedLocation = location;
                    //       });
                    //     },
                    //   ),
                    // );
                  },
                  trailing: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.locationArrow,
                      color: AppColors.gray,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 8.height),
              ],
            ),
          );
        }
      },
    );
  }
}
