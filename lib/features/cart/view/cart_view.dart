import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_bloc.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_bar.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_buttons.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_coupon_field.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_price_summary.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_products.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_empty_screen.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    CartBloc.of(context).add(Get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "cart".tr(),
        leading: InkWell(
          onTap: () => RouteUtils.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<CartBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Empty) {
            return const AppEmptyScreen(
                title: "add_some_products_to_your_cart");
          } else {
            var bloc = CartBloc.of(context);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartBar(cartModel: bloc.cartModel),
                    SizedBox(height: 12.height),
                    CartProudcts(cartModel: bloc.cartModel),
                    SizedBox(height: 16.height),
                    const CartCouponField(),
                    SizedBox(height: 24.height),
                    CartPriceSummary(cartModel: bloc.cartModel),
                    SizedBox(height: 80.height),
                    const CartButtons(),
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
