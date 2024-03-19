import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/product_details/view/view.dart';
import 'package:harri_farm_app/features/sections/bloc/tabs/cubit.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class SectionGridItems extends StatelessWidget {
  const SectionGridItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsStates>(
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.width,
              crossAxisSpacing: 8.height,
              childAspectRatio: 2 / 3,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return AppProductCard(
                onTap: () => RouteUtils.navigateTo(const ProductDetailsView()),
              );
            },
          ),
        );
      },
    );
  }
}
