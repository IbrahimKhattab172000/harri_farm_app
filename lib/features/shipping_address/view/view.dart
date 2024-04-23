import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/shipping_address/bloc/shipping_address_bloc.dart';
import 'package:harri_farm_app/features/shipping_address/widgets/shipping_address_button.dart';
import 'package:harri_farm_app/features/shipping_address/widgets/shipping_address_forms.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "location".tr(),
        leading: InkWell(
          onTap: () => RouteUtils.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<ShippingAddressBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var bloc = ShippingAddressBloc.of(context);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.height),
                    ShippingAddressForms(addressesData: bloc.addressesData),
                    SizedBox(height: 40.height),
                    const ShippingAddressButton(),
                    SizedBox(height: Utils.bottomDevicePadding + 28),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
