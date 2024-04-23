import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_bloc.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_price_summary.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_selection/cubit.dart';
import 'package:harri_farm_app/features/payment/widgets/payment_button.dart';
import 'package:harri_farm_app/features/payment/widgets/payment_card_details.dart';
import 'package:harri_farm_app/features/payment/widgets/payment_method_selection.dart';
import 'package:harri_farm_app/features/payment/widgets/payment_shipping_details.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "payment".tr(),
        leading: InkWell(
          onTap: () => RouteUtils.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => PaymentSelectionCubit(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.height),
                const PaymentShippingDetails(),
                SizedBox(height: 32.height),
                const PaymentMethodSelection(),
                BlocBuilder<PaymentSelectionCubit, PaymentSelectionState>(
                  builder: (context, state) {
                    if (state is PaymentSelectionCredit) {
                      return const PaymentCardDetails();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                SizedBox(height: 40.height),
                // const MyOrderDetailsPriceSummary(),
                CartPriceSummary(cartModel: CartBloc.of(context).cartModel),
                SizedBox(height: 40.height),
                const PaymentButton(),
                SizedBox(height: Utils.bottomDevicePadding + 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
