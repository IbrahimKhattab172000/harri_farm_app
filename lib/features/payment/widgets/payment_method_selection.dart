import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_bloc.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_selection/cubit.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle_button.dart';

class PaymentMethodSelection extends StatelessWidget {
  const PaymentMethodSelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSelectionCubit, PaymentSelectionState>(
      builder: (context, state) {
        final cubit = PaymentSelectionCubit.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: "select_the_payment_method".tr(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 24.height),
            PaymentMethodSelectionBar(
              imagePath: "wallet",
              title: "payment_in_cash",
              onTap: () {
                cubit.toggleStates(isCash: true);
                cubit.payInCash == true
                    ? PaymentBloc.of(context).paymentType = "offline"
                    : "online";
              },
              value: cubit.payInCash,
            ),
            SizedBox(height: 8.height),
            const Divider(
              color: AppColors.lightGray,
              thickness: 2,
            ),
            SizedBox(height: 8.height),
            PaymentMethodSelectionBar(
              imagePath: "credit_card",
              title: "payment_via_visa",
              onTap: () {
                cubit.toggleStates(isCash: false);
                cubit.payInCash == true
                    ? PaymentBloc.of(context).paymentType = "offline"
                    : "online";
              },
              value: cubit.payInCash ? false : true,
            )
          ],
        );
      },
    );
  }
}

class PaymentMethodSelectionBar extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  final bool value;

  const PaymentMethodSelectionBar({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            Utils.getAssetPNGPath(imagePath),
            width: 24.width,
            height: 24.height,
          ),
          SizedBox(width: 8.width),
          AppText(
            title: title.tr(),
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          AppToggleButton(value: value),
        ],
      ),
    );
  }
}
