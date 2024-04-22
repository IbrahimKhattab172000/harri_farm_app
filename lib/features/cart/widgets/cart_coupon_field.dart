import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_coupon_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class CartCouponField extends StatelessWidget {
  const CartCouponField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCouponBloc, AppState>(
      builder: (context, state) {
        final bloc = CartCouponBloc.of(context);
        return Container(
          height: 52.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.lightGray.withOpacity(0.4),
          ),
          child: Row(
            children: [
              SizedBox(width: 12.width),
              Image.asset(
                Utils.getAssetPNGPath("coupon"),
                width: 24.width,
                height: 24.height,
                color: AppColors.gray,
              ),
              SizedBox(width: 8.width),
              Form(
                key: bloc.cartCouponBlocKey,
                child: Expanded(
                  child: AppTextField(
                    hint: "enter_the_discount_code".tr(),
                    transperent: true,
                    fillColor: Colors.transparent,
                    controller: bloc.couponController,
                  ),
                ),
              ),
              SizedBox(width: 8.width),
              InkWell(
                onTap: () {
                  CartCouponBloc.of(context).add(Click());
                },
                child: AppText(
                  title: "activate".tr(),
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.width),
            ],
          ),
        );
      },
    );
  }
}
