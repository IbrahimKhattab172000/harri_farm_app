import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_bloc.dart';
import 'package:harri_farm_app/features/shipping_address/bloc/shipping_address_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class PaymentShippingDetails extends StatelessWidget {
  const PaymentShippingDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingAddressBloc, AppState>(
      builder: (context, state) {
        final shippingAddressBloc = ShippingAddressBloc.of(context);
        final paymentBloc = PaymentBloc.of(context);

        AddressesModel addressesModel = shippingAddressBloc.addressesData;

        int? parsedAddressId = int.tryParse(paymentBloc.addressId ?? '');

        Address address = addressesModel.addresses?.firstWhere(
              (element) => element.id == parsedAddressId,
              orElse: () => Address(),
            ) ??
            Address();

        return Column(
          children: [
            Row(
              children: [
                AppText(
                  title: "shipping_details".tr(),
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    RouteUtils.pop();
                  },
                  child: AppText(
                    title: "add_location".tr(),
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.height),
            Container(
              // height: 142.height,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: address.name ?? "dummy",
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 4.height),
                    address.phone == ""
                        ? const SizedBox()
                        : AppText(
                            title: address.phone ?? "dummy",
                            fontSize: 14,
                            color: AppColors.lightGray,
                          ),
                    SizedBox(height: 4.height),
                    AppText(
                      title: address.addressDetails ?? "dummy",
                      fontSize: 14,
                      color: AppColors.lightGray,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
