import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_bloc.dart';
import 'package:harri_farm_app/features/cart/models/cart_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class CartBar extends StatelessWidget {
  final CartModel cartModel;
  const CartBar({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: "${cartModel.data?.cart?.length.toInt()} ${"products".tr()}",
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            CartBloc.of(context).add(Delete());
          },
          child: AppText(
            title: "delete_cart".tr(),
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
