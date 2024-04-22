import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';

import 'package:harri_farm_app/features/product_details/models/product_details_model.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_drop_down_menu.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsExtraService extends StatelessWidget {
  final ProductDetailsModel product;
  const ProductDetailsExtraService({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, AppState>(
      builder: (context, state) {
        final bloc = ProductDetailsBloc.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: "extra_service".tr(),
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16.height),
              AppDropDownSelection.single(
                initialItem: SelectionItem(
                  label: product.data?.offer?.addition?[0].name ?? "dummy",
                  value: product.data?.offer?.addition?[0].id ?? "dummy",
                  price:
                      "(+\$ ${product.data?.offer?.addition?[0].price ?? "dummy"})",
                ),
                onChangeSingle: (value) {
                  bloc.fillBody(addition: "${value?.value}");
                },
                items:
                    (product.data?.offer?.addition ?? []).map((extraService) {
                  return SelectionItem(
                    label: extraService.name ?? "dummy",
                    value: extraService.id ?? "dummy",
                    price: "(+\$ ${extraService.price ?? "dummy"})",
                  );
                }).toList(),
                hint: "اختر واحدة من الإضافات",
                height: MediaQuery.of(context).size.height * 0.33,
              ),
              SizedBox(height: 16.height),
            ],
          ),
        );
      },
    );
  }
}
