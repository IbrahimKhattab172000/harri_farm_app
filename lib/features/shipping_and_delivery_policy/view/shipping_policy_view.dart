import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/bloc/shipping_policy_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ShippingAndDeliveryPolicyView extends StatelessWidget {
  const ShippingAndDeliveryPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "shipping_and_delivery_policy".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<ShippingPolicyBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: AppText(title: 'error_loading_data'.tr()));
          } else {
            final bloc = ShippingPolicyBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 30.height),
                    AppText(
                      title: bloc.shippingPolicyData.data?.title ?? "",
                      fontSize: 16,
                      color: Colors.black,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Utils.bottomDevicePadding),
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
