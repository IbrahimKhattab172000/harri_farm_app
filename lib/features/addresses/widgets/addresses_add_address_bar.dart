import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/add_address/bloc/get_cities_and_regions_bloc.dart';
import 'package:harri_farm_app/features/add_address/view/add_address_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AddressesAddBar extends StatelessWidget {
  const AddressesAddBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CitiesAndRegionsBloc.of(context).add(Get());
        RouteUtils.navigateTo(const AddAddressView());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_outline,
            size: 28,
            color: AppColors.primary,
          ),
          SizedBox(width: 8.width),
          AppText(
            title: "add_new_address".tr(),
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
