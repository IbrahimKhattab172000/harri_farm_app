import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/all_offers/bloc/all_offers_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class OffersGridItems extends StatelessWidget {
  const OffersGridItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = AllOffersBloc.of(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.width,
            crossAxisSpacing: 8.height,
            childAspectRatio: 2 / 3,
          ),
          itemCount: bloc.allOffersData.data!.offers!.length,
          itemBuilder: (context, index) {
            return AppProductCard(
              product: bloc.allOffersData.data!.offers![index],
              isFavorite: bloc.allOffersData.data!.offers![index].like ?? false,
            );
          },
        ),
      ),
    );
  }
}
