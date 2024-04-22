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

class ProductDetailsShredder extends StatefulWidget {
  final ProductDetailsModel product;
  const ProductDetailsShredder({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsShredder> createState() => _ProductDetailsShredderState();
}

class _ProductDetailsShredderState extends State<ProductDetailsShredder> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, AppState>(
      builder: (context, state) {
        final bloc = ProductDetailsBloc.of(context);

        final cuttings = widget.product.data?.offer?.cutting;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: "shredder_type".tr(),
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16.height),
              if (cuttings != null && cuttings.isNotEmpty)
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cuttings.length,
                  itemBuilder: (context, index) {
                    final cutting = cuttings[index];
                    return AppToggleCard(
                      title: cutting.name ?? "dummy",
                      isSelected: selectedIndex == cutting.id,
                      price: "(+\$ ${cutting.price ?? "dummy"})",
                      onTap: () {
                        setState(() {
                          selectedIndex = cutting.id!;
                          bloc.fillBody(cuttingId: selectedIndex.toString());
                          log(cutting.id.toString());
                        });
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
