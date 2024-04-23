import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_bloc.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_drop_down_menu.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ShippingAddressForms extends StatefulWidget {
  final AddressesModel addressesData;
  const ShippingAddressForms({
    super.key,
    required this.addressesData,
  });

  @override
  State<ShippingAddressForms> createState() => _ShippingAddressFormsState();
}

class _ShippingAddressFormsState extends State<ShippingAddressForms> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    List<SelectionItem> addresses = widget.addressesData.addresses
            ?.map((e) => SelectionItem(
                  label: e.name.toString(),
                  value: e.id,
                ))
            .toList() ??
        [];
    final bloc = PaymentBloc.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          label: "name".tr(),
          controller: bloc.nameController,
        ),
        SizedBox(height: 8.height),
        AppTextField(
          label: "phone_number".tr(),
          controller: bloc.phoneController,
        ),
        SizedBox(height: 8.height),
        AppTextField(
          label: "additional_phone_number".tr(),
          controller: bloc.extraPhoneController,
        ),
        SizedBox(height: 12.height),
        AppTextField(
          label: "email".tr(),
          controller: bloc.emailController,
        ),
        SizedBox(height: 12.height),
        AppText(
          title: "pick_up_address".tr(),
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8.height),
        AppDropDownSelection.single(
          height: MediaQuery.sizeOf(context).height * 0.2,
          initialItem: null,
          items: addresses,
          onChangeSingle: (value) {
            // CitiesAndRegionsBloc.of(context)
            //     .add(Read(arguments: value?.value.toString() ?? "0"));

            bloc.addressId = value?.value.toString() ?? "0";
          },
          hint: "pick_up_address".tr(),
        ),
        SizedBox(height: 12.height),
        AppTextField(
          label: "add_extra_info".tr(),
          maxLines: 5,
          controller: bloc.noteController,
        ),
      ],
    );
  }
}
