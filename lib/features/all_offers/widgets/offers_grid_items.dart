import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/all_offers/bloc/all_offers_bloc.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/product_details/view/view.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class OffersGridItems extends StatelessWidget {
  const OffersGridItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = AllOffersBloc.of(context);

    return BlocBuilder<FavouriteBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(
            child: AppText(title: 'error_loading_data'.tr()),
          );
        } else {
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
                    offer: bloc.allOffersData.data!.offers![index],
                    onTap: () =>
                        RouteUtils.navigateTo(const ProductDetailsView()),
                    isFavorite:
                        bloc.allOffersData.data!.offers![index].like ?? false,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
