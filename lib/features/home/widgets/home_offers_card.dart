import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class HomeOffersCards extends StatelessWidget {
  const HomeOffersCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc.of(context);
    return Container(
      constraints: BoxConstraints(maxHeight: 270.height),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: bloc.homeData.offer!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppProductCard(
              product: bloc.homeData.offer?[index],
              isFavorite: bloc.homeData.offer![index].like ?? false,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 24.width);
        },
      ),
    );
  }
}
