import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';
import 'package:harri_farm_app/features/shipping_address/widgets/shipping_address_pick_location.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_drop_down_menu.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ShippingAddressFields extends StatefulWidget {
  const ShippingAddressFields({
    super.key,
  });

  @override
  State<ShippingAddressFields> createState() => _ShippingAddressFieldsState();
}

class _ShippingAddressFieldsState extends State<ShippingAddressFields> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(label: "name".tr()),
        SizedBox(height: 8.height),
        AppTextField(label: "phone_number".tr()),
        SizedBox(height: 8.height),
        AppTextField(label: "additional_phone_number".tr()),
        SizedBox(height: 8.height),
        AppTextField(label: "exact_location".tr()),
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
          initialItem: SelectionItem(label: "Mansoura", value: 1),
          items: [
            SelectionItem(label: "Samanud", value: 2),
            SelectionItem(label: "Mahalah", value: 3),
          ],
          onChangeSingle: (value) {},
          hint: "",
        ),
        SizedBox(height: 8.height),
        AppTextField(label: "neighborhood".tr()),
        SizedBox(height: 8.height),
        AppTextField(label: "st_name".tr()),
        SizedBox(height: 8.height),
        AppTextField(label: "residential_number".tr()),
        SizedBox(height: 8.height),
        AppTextField(
          label: "pick_location_on_map".tr(),
          controller: TextEditingController(
              text: selectedLocation != null
                  ? "${selectedLocation!.latitude}, ${selectedLocation!.longitude}"
                  : ""),
          onTap: () async {
            RouteUtils.navigateTo(
              ShippingAddressPickLocation(
                onSelectLocation: (location) {
                  setState(() {
                    selectedLocation = location;
                  });
                },
              ),
            );
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
        AppTextField(
          label: "add_extra_info".tr(),
          maxLines: 5,
        ),
      ],
    );
  }
}
