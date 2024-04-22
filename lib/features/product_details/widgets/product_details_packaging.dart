import 'dart:developer';

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

class ProductDetailsPackaging extends StatefulWidget {
  final ProductDetailsModel product;
  const ProductDetailsPackaging({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsPackaging> createState() =>
      _ProductDetailsPackagingState();
}

class _ProductDetailsPackagingState extends State<ProductDetailsPackaging> {
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
                title: "packaging".tr(),
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16.height),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.product.data?.offer?.wrapping?.length ?? 0,
                itemBuilder: (context, index) {
                  final wrappingOptions = widget.product.data?.offer?.wrapping;
                  if (wrappingOptions != null &&
                      index < wrappingOptions.length) {
                    final wrappingOption = wrappingOptions[index];
                    return AppToggleCard(
                      title: wrappingOption.name ?? "dummy",
                      isSelected: selectedIndex == wrappingOption.id,
                      onTap: () {
                        setState(() {
                          selectedIndex = wrappingOption.id!;
                          bloc.fillBody(wrappingId: selectedIndex.toString());
                          log(selectedIndex.toString());
                        });
                      },
                      price: wrappingOption.price ?? "dummy",
                    );
                  }
                  return const SizedBox
                      .shrink(); // Return an empty widget if wrappingOption is null or index is out of range
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
