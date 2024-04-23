import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';

import 'package:harri_farm_app/features/product_details/models/product_details_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsOrderType extends StatefulWidget {
  final ProductDetailsModel product;
  const ProductDetailsOrderType({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsOrderType> createState() =>
      _ProductDetailsOrderTypeState();
}

class _ProductDetailsOrderTypeState extends State<ProductDetailsOrderType> {
  int selectedIndex = 0;

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
                title: "order_type".tr(),
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16.height),
              if (widget.product.data?.offer?.orderType != null)
                ...widget.product.data!.offer!.orderType!.asMap().entries.map(
                      (entry) => AppToggleCard(
                        title: entry.value.name ?? "dummy",
                        isSelected: selectedIndex ==
                            int.parse(entry.value.id.toString()),
                        onTap: () {
                          setState(() {
                            selectedIndex =
                                int.parse(entry.value.id.toString());
                            // print(selectedIndex);
                            bloc.fillBody(orderTypeId: "$selectedIndex");
                          });
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
