// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_buttons.dart';

import 'package:harri_farm_app/features/cart/widgets/cart_coupon_field.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_price_summary.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_products.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.height),
                const CartProudcts(),
                SizedBox(height: 16.height),
                const CartCouponField(),
                SizedBox(height: 24.height),
                const CartPriceSummary(),
                SizedBox(height: 80.height),
                const CartButtons(),
                SizedBox(height: Utils.bottomDevicePadding + 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
