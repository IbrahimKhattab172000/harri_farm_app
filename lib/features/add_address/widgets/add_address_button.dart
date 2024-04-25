import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/add_address/bloc/add_address_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else {
          final bloc = AddAddressBloc.of(context);

          return AppButton(
            title: "save".tr(),
            onTap: () {
              if (!bloc.addAddresKey.currentState!.validate() ||
                  bloc.cityId == null ||
                  bloc.countryId == null) {
                showSnackBar("empty_fields", errorMessage: false);
              } else {
                AddAddressBloc.of(context).add(Click());
                RouteUtils.pop();
              }
            },
          );
        }
      },
    );
  }
}
